import smtplib
import csv
from datetime import datetime, timedelta
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.MIMEBase import MIMEBase
from email.Utils import COMMASPACE, formatdate
from email import Encoders
import config

def send(recipients, subject, body, files=[]):
    if config.PASSWORD == None:
        raise Exception("You must set GMAILPASSW with the '%s' password. You can change the user by setting GMAILUSER" % SENDER)
    smtp = smtplib.SMTP(config.SMTPSERVER, config.SMTPPORT)
    smtp.ehlo()
    smtp.starttls()
    smtp.ehlo()
    smtp.login(config.SENDER, config.PASSWORD)

    mail = MIMEMultipart()
    mail['Subject'] = subject
    mail['Date'] = formatdate(localtime=True)
    mail['From'] = config.SENDER
    mail['To'] = COMMASPACE.join(recipients)
    mail.preamble = 'This is a multi-part message in MIME format.'
    mail.attach(MIMEText(body))

    for f in files:
        part = MIMEText(open(f,"r").read())
        Encoders.encode_quopri(part)
        part.add_header('Content-Disposition', 'attachment; filename="%s"' % os.path.basename(f))
        mail.attach(part)

    smtp.sendmail(config.SENDER, recipients, mail.as_string())
    smtp.quit()  
    print "Sent to ", 
    print recipients

if __name__ == "__main__":
    send_happybirthday(["leonardo@microsoft.com"])
