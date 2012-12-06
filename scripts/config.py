import os

SMTPSERVER='smtp.gmail.com'
SMTPPORT=587
SENDER = os.getenv('GMAILUSER', 'leodemouramsr@gmail.com')
PASSWORD = os.getenv('GMAILPASSW', None).strip('\"\' \t\n')
if PASSWORD == None:
    raise Exception("You must set GMAILPASSW with the '%s' password. You can change the user by setting GMAILUSER" % SENDER)

DEVS=["leonardo@microsoft.com"]
ORIGIN="https://git01.codeplex.com/z3"
GIT="git"
PYTHON="python"
JAVA="java"
BUILDDIR="build"

