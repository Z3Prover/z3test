"Module for sending emails to developers"

import os
from smtplib import *
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.MIMEBase import MIMEBase
from email.Utils import COMMASPACE, formatdate
from email import Encoders

import config

def send(subject, txt, files, devs):
    mail = MIMEMultipart()
    mail['Subject'] = subject
    mail['Date'] = formatdate(localtime=True)
    mail['From'] = config.FROM
    mail['To'] = COMMASPACE.join(devs)
    mail.preamble = 'This is a multi-part message in MIME format.'
    mail.attach(MIMEText(txt))
    if len(files) == 0:
        # Hack when there is no attachment
        part = MIMEText('')
        Encoders.encode_quopri(part)
        mail.attach(part)
    else:
        for f in files:
            part = MIMEText(open(f,"r").read())
            Encoders.encode_quopri(part)
            part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(f))
            mail.attach(part)
    try:
        s = SMTP(config.SMTPSERVER)
        s.starttls()
        s.sendmail(config.FROM, devs, mail.as_string())
        s.quit()
    except:
        print "Error sending email message."

if __name__ == "__main__":
    send("Test", "Test message", [ "out.txt" ], [ config.FROM ])
