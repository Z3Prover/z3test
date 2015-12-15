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
vm_host = 'z3-mac'
vm_user = 'nightly'
vm_timeout = 60

admins = [ 'cwinter@microsoft.com' ]

devs   = [ 'cwinter@microsoft.com',
           'leonardo@microsoft.com',
           'nbjorner@microsoft.com',
           'kenmcmil@microsoft.com',
           'rybal@microsoft.com',
           'nlopes@microsoft.com'
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
        part = MIMEText(open(f,"r").read())
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
    # ec = subprocess.call(['VBoxManage', 'controlvm', name, 'pause'], stdin=None, stdout=log, stderr=log
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

def call_logged(cmdline, log, checked=True):
    for str in cmdline:
        log.write(str + ' ')
    log.write('\n')
    ec = subprocess.call(cmdline, stdin=None, stdout=log, stderr=log)
    if (checked and ec != 0):
        log.write('Error code: %d\n' % ec)
        return 1
    return 0

def runbuild(vm, vm_port, need_start, file_pattern): # 0 = ok, 1 = infrastructure problem, 2 = build problem
    logname = vm.replace(' ', '_') + '.log'
    log = open(logname, 'w')
    if (need_start):
        if (startvm(vm, log) != 0):
            log.write('Error starting VM\n')
            return 1
    ec = subprocess.call(['scp', '-o', 'ConnectTimeout=60', '-P', '%d' % vm_port, 'build_z3.sh', vm_user + '@' + vm_host + ':.'], stdin=None, stdout=log, stderr=log)
    if (ec != 0): 
        log.write('Error copying script\n')
        return 1
    ec = subprocess.call(['ssh', '-o', 'ConnectTimeout=60', vm_user + '@' + vm_host, '-p', '%d' % vm_port, 'chmod', '+x', 'build_z3.sh'], stdin=None, stdout=log, stderr=log)
    if (ec != 0): 
        log.write('Error setting permissions\n')
        return 1
    ec = subprocess.call(['ssh', '-o', 'ConnectTimeout=3600', vm_user + '@' + vm_host, '-p', '%d' % vm_port, './build_z3.sh', '>', 'build_z3.log', '2>&1'], stdin=None, stdout=log, stderr=log)
    #errors from previous command are ignored; they should be logged anyways.
    ec = subprocess.call(['scp', '-o', 'ConnectTimeout=60', '-P', '%d' % vm_port, vm_user + '@' + vm_host + ':build_z3.log', 'temp.log' ], stdin=None, stdout=log, stderr=log)
    if (ec != 0): 
        log.write('Error retrieving build log')
        return 1

    ok = False;
    tl = open('temp.log', 'r')
    for line in tl.readlines():
        if (line.rstrip() == 'Build succeeded.'):
            ok = True
        log.write(line)
    tl.close()

    if ok:
        ec = subprocess.call(['scp', '-o', 'ConnectTimeout=60', '-P', '%d' % vm_port, '-p', vm_user + '@' + vm_host + ':z3/dist/*.zip', dist + '/'], stdin=None, stdout=log, stderr=log)
        if (ec != 0):
            log.write('Error retrieving distribution files')
            return 1                            
    
    if (need_start):
        stopvm(vm, log)

    if (ok):
        # Commit the distro into bin.
        prev_dir = os.getcwd()
        os.chdir(bin_dir)
        if call_logged(['git', 'pull', '--rebase', '-v'], log) != 0:
            os.chdir(prev_dir)
            return 1
        for file in glob.glob('*.zip'):
            if file_pattern in file:
                # We don't `git rm' old files, but wipe them from the history.
                os.chdir(prev_dir)
                os.chdir(bin_repo)
                call_logged(['git', 'filter-branch', '-f', '--prune-empty', '--tree-filter', ' rm -f %s/%s' % (bin_subdir, file), 'HEAD'], log)
                os.chdir(prev_dir)
                os.chdir(bin_dir)
        for file in glob.glob('%s/%s/*.zip' % (prev_dir, dist)):
            if file_pattern in file:
                shutil.copy(file, '.')
                if call_logged(['git', 'add', '-v', os.path.basename(file)], log) != 0:
                    os.chdir(prev_dir)
                    return 1
                shutil.copy(os.path.join(prev_dir, logname), file + '.log')
                if call_logged(['git', 'add', '-v', os.path.basename(file + '.log')], log) != 0:
                    os.chdir(prev_dir)
                    return 1

        call_logged(['git', 'commit', '-v', '-m', 'Automatic nightly build.'], log, False)
        if call_logged(['git', 'push', '-v', '--force'], log) != 0:
            os.chdir(prev_dir)
            return 1
        call_logged(['git', 'gc', '--aggressive', '--auto', '--prune=all'], log, False)
        os.chdir(prev_dir)
        log.close()
        return 0
    else:
        log.close()
        send_email(devs, 'Build failed at ' + vm, 'The build failed; please check the attached logfile for errors.', [logname])
        print 'Failure email sent.'
        return 2

def main():
    # clean up distros
    for f in os.listdir(dist):
        (fn, ext) = os.path.splitext(f)
        if (ext == '.zip'):
            fp = os.path.join(dist, f)
            if os.path.isfile(fp):
                os.unlink(fp)
    # start to build new distros
    for [vm, port, need_start, file_pattern] in vms:        
        print 'Building Z3 on ' + vm 
        q = runbuild(vm, port, need_start, file_pattern)
        if (q == 1):
            send_email(admins, 'Build infrastructure failure', 'The infrastructure failed while building at ' + vm, [vm.replace(' ', '_') + '.log'])
            pass
        #input('Enter to continue...')
        
if __name__ == '__main__':
    main()
