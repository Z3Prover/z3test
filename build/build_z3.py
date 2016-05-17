#!/usr/bin/env python

import os
import subprocess
import time
import smtplib
import glob
import shutil, errno

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.MIMEBase import MIMEBase
from email.Utils import COMMASPACE, formatdate
from email import Encoders

vms = [ 
    ['OSX x64', 22, False, 'x64-osx'],
    ['Ubuntu x86', 1024, True, 'x86-ubuntu'],
    ['Ubuntu amd64', 1025, True, 'x64-ubuntu'],
    ['FreeBSD 10 amd64', 1026, True, 'x64-freebsd'],
    ['Debian 8 amd64', 1027, True, 'x64-debian'],
    #['OpenBSD 8.5 amd64', 1028, True, 'x64-openbsd']
    ]

vm_wait_time = 120
vm_host = 'localhost'
vm_user = 'nightly'
vm_timeout = 60

admins = [ 'cwinter@microsoft.com' ]

devs   = [ 'cwinter@microsoft.com',
           'leonardo@microsoft.com',
           'nbjorner@microsoft.com',
           'kenmcmil@microsoft.com',
           'nlopes@microsoft.com',
           'mikjan@microsoft.com'
           ]

smtp_serv = '127.0.0.1'
smtp_port = 25
smtp_from = 'Z3 Build Server <z3build@z3-mac.microsoft.com>'

bin_repo = 'bin'
bin_subdir = 'nightly'
bin_dir = bin_repo + '/' + bin_subdir
dist = 'distros'


def send_email(recipients, subject, body, files=[]):
    smtp = smtplib.SMTP(smtp_serv, smtp_port)
    smtp.ehlo()

    mail = MIMEMultipart()
    mail['Subject'] = subject
    mail['Date'] = formatdate(localtime=True)
    mail['From'] = smtp_from
    mail['To'] = COMMASPACE.join(recipients)
    mail.preamble = 'This is a multi-part message in MIME format.'
    mail.attach(MIMEText(body))

    for f in files:
        part = MIMEText(open(f, 'r').read())
        Encoders.encode_quopri(part)
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(f))
        mail.attach(part)

    smtp.sendmail(smtp_from, recipients, mail.as_string())
    smtp.quit()  

def startvm(name, log):
    vmstate = 'unknown'
    info = subprocess.check_output(['VBoxManage', 'showvminfo', name, '--machinereadable'])
    for line in info.splitlines():
        if line.startswith('VMState='):
            vmstate = line[8:].strip('"')
    log.write('VM state: %s\n' % vmstate)
    ec = 0
    if vmstate == 'running':
        log.write('VM is running; OK.\n')
        return 0
    elif vmstate == 'poweroff' or vmstate == 'aborted' or vmstate == 'saved':
        log.write('VM is powered down; trying to start it.\n')
        ec = subprocess.call(['VBoxManage', 'startvm', name, '--type', 'headless'], stdin=None, stdout=log, stderr=log)
        log.write('Waiting %d seconds until the VM is up.\n' % vm_wait_time)
        time.sleep(vm_wait_time)
        return 0
    elif vmstate == 'paused':
        ec = subprocess.call(['VBoxManage', 'controlvm', name, 'resume'], stdin=None, stdout=log, stderr=log)
        if (ec != 0):
            log.write('VM could not be resumed; trying to restart it.\n')
            ec = subprocess.call(['VBoxManage', 'controlvm', name, 'poweroff'], stdin=None, stdout=log, stderr=log)
            ec = subprocess.call(['VBoxManage', 'startvm', name, '--type', 'headless'], stdin=None, stdout=log, stderr=log)            
            log.write('Waiting %d seconds until the VM is up.\n' % vm_wait_time)
            time.sleep(vm_wait_time)
        return ec
    else:
        log.write('VM could not be (re)started.\n')
        if ec == 0:
            return 1
        else:
            ec

def stopvm(name, log):
    ec = subprocess.call(['VBoxManage', 'controlvm', name, 'acpipowerbutton'], stdin=None, stdout=log, stderr=log)
    if (ec != 0):
        log.write('Error stopping the VM (or putting to sleep); killing it the hard way.')
        ec = subprocess.call(['VBoxManage', 'controlvm', name, 'poweroff'], stdin=None, stdout=log, stderr=log)
        if (ex != 0):
            log.write('VM refuses to be stopped; may be left running.')
    else:
        # Some systems need to be poked a second time.
        time.sleep(vm_wait_time)
        subprocess.call(['VBoxManage', 'controlvm', name, 'acpipowerbutton'], stdin=None, stdout=log, stderr=log)

class BuildFailureException(Exception):
    pass

def mk_args(cmd):
    css = cmd.split(' ')
    in_string = False
    cs = []
    cur = ""
    for i in css:
        if not in_string and i.startswith('"') and i.endswith('"'):
            cs = cs + [i[1:-1]]
        elif not in_string and i.startswith('"'):
            in_string = True
            cur = i[1:]
        elif in_string and i.endswith('"'):
            in_string = False
            cur = cur + ' ' + i
            cs = cs + [cur[:-1]]
        elif in_string:
            cur = cur + ' ' + i
        else:
            cs = cs + [i]
    return cs

def call_unlogged(cmd, checked=True):
    cs = mk_args(cmd)
    ec = subprocess.call(cs, stdin=None)
    if (checked and ec != 0):
        raise BuildFailureException('Command failed: ' + cmd)

def call_logged(cmd, log, checked=True):
    cs = mk_args(cmd)
    log.write(' '.join(cs) + '\n')
    ec = subprocess.call(cs, stdin=None, stdout=log, stderr=log)
    log.flush()
    if (checked and ec != 0):
        log.write('Error code: %d\n' % ec)
        raise BuildFailureException('Command failed.')

def scpput(from_file, to_file, vm_port, vm_user, vm_host, log):
    args = ['scp', '-o', 'ConnectTimeout=60', '-P', '%d' % vm_port, from_file, vm_user + '@' + vm_host + ':' + to_file]
    log.write(' '.join(args) + '\n')
    ec = subprocess.call(args, stdin=None, stdout=log, stderr=log)
    log.flush()
    if ec != 0: 
        log.write('non-zero exit-code: %d\n' % ec)
        raise BuildFailureException('Could not copy file.')

def scpget(from_file, to_file, vm_port, vm_user, vm_host, log):
    args = ['scp', '-o', 'ConnectTimeout=60', '-P', '%d' % vm_port, vm_user + '@' + vm_host + ':' + from_file, to_file]
    log.write(' '.join(args) + '\n')
    ec = subprocess.call(args, stdin=None, stdout=log, stderr=log)
    log.flush()
    if ec != 0: 
        log.write('non-zero exit-code: %d\n' % ec)
        raise BuildFailureException('Could not copy file.')

def sshrun(cmd, vm_port, vm_user, vm_host, log):
    cs = mk_args('"' + cmd + '"')
    args = ['ssh', '-o', 'ConnectTimeout=60', vm_user + '@' + vm_host, '-p', '%d' % vm_port] + cs
    log.write(' '.join(args) + '\n')
    ec = subprocess.call(args, stdin=None, stdout=log, stderr=log)
    log.flush()
    if ec != 0: 
        log.write('non-zero exit-code: %d\n' % ec)
        raise BuildFailureException('Could not execute command.')

def runbuild(vm, vm_port, need_start, file_pattern): # 0 = ok, 1 = infrastructure problem, 2 = build problem
    logname = vm.replace(' ', '_') + '.log'
    log = open(logname, 'w')   
    err_code = 0
    start_dir = os.getcwd()
    log.flush()

    try:
        if (need_start): 
            if (startvm(vm, log) != 0): 
                raise BuildFailureException('Error starting VM\n')

        scpput('build_z3.sh', 'build_z3.sh', vm_port, vm_user, vm_host, log)
        sshrun('chmod +x build_z3.sh', vm_port, vm_user, vm_host, log)
        try:
            sshrun('./build_z3.sh > build_z3.log 2>&1', vm_port, vm_user, vm_host, log)
        except BuildFailureException as ex:
            pass # Build is broken, but we still want the log if there is one.
        scpget('build_z3.log', 'temp.log', vm_port, vm_user, vm_host, log)

        ok = False;
        tl = open('temp.log', 'r')
        for line in tl.readlines():
            if (line.rstrip() == 'Build succeeded.'): 
                ok = True
            log.write(line)
        tl.close()
        os.unlink('temp.log')
        if not ok:
            raise BuildFailureException('Build unsuccessful.')

        sshrun('cd z3/dist ; ls -1 *.zip > ../../build_z3.df', vm_port, vm_user, vm_host, log)
        scpget('build_z3.df', 'temp.df', vm_port, vm_user, vm_host, log)
        with open('temp.df') as tf: dfile = tf.readline().strip()
        os.unlink('temp.df')
        scpget('z3/dist/' + dfile, dist + '/' + dfile, vm_port, vm_user, vm_host, log)
        shutil.copy(logname, dist + '/' + dfile + '.log')

        if (need_start): stopvm(vm, log)

        # Commit the distro file into bin.        
        os.chdir(bin_dir)

        # We don't `git rm' old files, but wipe them from the history.
        for file in glob.glob('*'):
            if file_pattern in file:
                os.chdir(start_dir)
                os.chdir(bin_repo)
                call_logged('git filter-branch -f --prune-empty --tree-filter "rm -f %s/%s" HEAD' % (bin_subdir, file), log)
                call_logged('git filter-branch -f --prune-empty --tree-filter "rm -f %s/z3-%s-failure-*.log" HEAD' % (bin_subdir, file_pattern), log)
                os.chdir(start_dir)
                os.chdir(bin_dir)

        for file in glob.glob('%s/%s/*.zip' % (start_dir, dist)):
            if file_pattern in file:
                shutil.copy(file, '.')
                shutil.copy(file + '.log', '.')
                call_logged('git add -v ' + os.path.basename(file), log)
                call_logged('git add -v ' + os.path.basename(file) + '.log', log)
                
        call_logged('git commit -v -m "Automatic nightly build."', log)
        call_logged('git push -v --force', log)
        
        os.chdir(start_dir)
        log.close()
        err_code = 0

    except BuildFailureException as ex:
        os.chdir(start_dir)
        log.write('Exception: ' + ex.message + '\n')
        log.close()

        # try to add the .log to the bin dir. 
        ffn = 'z3-' + file_pattern + '-failure-' + time.strftime('%d-%m-%Y-%H-%M-%S') + '.log'
        shutil.copy(logname, bin_dir + '/' + ffn)
        os.chdir(bin_dir)

        call_unlogged('git add -v ' + ffn)
        call_unlogged('git commit -v -m "Added build failure log."')

        os.chdir(start_dir)
        send_email(devs, 'Build failed at ' + vm, 'The build failed; please check the attached logfile for errors.', [logname])
        print 'Failure email sent.'
        err_code = 2

    return err_code

def main():
    #clean up bin
    start_dir = os.getcwd()
    os.chdir(bin_dir)
    call_unlogged('git reset --hard origin/master')
    call_unlogged('git clean -f')
    call_unlogged('git pull -v -s recursive -Xtheirs')
    os.chdir(start_dir)

    # clean up distros
    for f in os.listdir(dist):
        (fn, ext) = os.path.splitext(f)
        if (ext == '.zip'):
            fp = os.path.join(dist, f)
            if os.path.isfile(fp):
                os.unlink(fp)
        if (ext == '.log'):
            fp = os.path.join(dist, f)
            if os.path.isfile(fp):
                os.unlink(fp)

    # start to build new distros
    for [vm, port, need_start, file_pattern] in vms:        
        os.chdir(start_dir)
        print 'Building Z3 on ' + vm 
        q = runbuild(vm, port, need_start, file_pattern)
        if (q == 1):
            send_email(admins, 'Build infrastructure failure', 'The infrastructure failed while building at ' + vm, [vm.replace(' ', '_') + '.log'])
            pass

    # remove garbage from the bin directory
    os.chdir(bin_dir)    
    call_unlogged('git gc --aggressive --auto --prune=all', False)
    os.chdir(start_dir)

        
if __name__ == '__main__':
    main()
