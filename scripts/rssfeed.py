# Copyright (c) 2015 Microsoft Corporation

import os
import subprocess
import config
import util
import datetime
import cgi

print('<?xml version="1.0" encoding="utf-8"?>')
print('<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:cf="http://www.microsoft.com/schemas/rss/core/2005">')
print('<channel xmlns:cfi="http://www.microsoft.com/schemas/rss/core/2005/internal" cfi:lastdownloaderror="None">')
# print('<?xml version="1.0" encoding="utf-8"?>')
# print('<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">')
# print('<channel>')
print('<title>Z3 commits</title>')
print('<description>Recent commits at github.com/z3prover</description>')
print('<link>http://research.microsoft.com/en-us/um/redmond/projects/z3/z3commits.xml</link>')
t = datetime.datetime.now()
s = t.strftime("%A, %d %B %Y, %I:%M%p PST")
print('<lastBuildDate>', s, '</lastBuildDate>')
print('<pubDate>', s, '</pubDate>')

z3dir = util.find_z3depot()
with util.cd(z3dir):
    NULL=open(os.devnull, 'wb')
    for branch in config.RSSFEED_BRANCHES:
        if subprocess.call(['git', 'checkout', branch], stdout=NULL, stderr=NULL) != 0:
            raise Exception("Failed to checkout %s" % branch)
        if subprocess.call(['git', 'pull'], stdout=NULL, stderr=NULL) != 0:
            raise Exception("Failed to update git depot")
    output = subprocess.Popen(['git', 'log', '--branches', '--pretty=format:%an | %cD | %s | %H', '-100'], stdout=subprocess.PIPE, stderr=NULL).communicate()[0]
    for line in output.splitlines():
        fields = line.split('|')
        if len(fields) == 4:
            print('<item>')
            print('<title>Commit by', fields[0], '</title>')
            print('<description>commit on %s<![CDATA[<br/>]]>%s</description>' % (fields[1].strip(' '), cgi.escape(fields[2].strip(' '))))
            print('<link>http://z3.codeplex.com/SourceControl/changeset/%s</link>' % fields[3].strip(' ')[:12])
            print('<pubDate>', fields[1], '</pubDate>')
            print('</item>')
        
print('')
print('</channel>')
print('</rss>')


