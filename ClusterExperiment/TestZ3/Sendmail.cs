using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

namespace TestZ3
{
    class Sendmail
    {
        static string domain = "@microsoft.com";

        public static void send(string to, string subject, string msg, string file)
        {
            MailMessage mail = new MailMessage(Environment.UserName + domain, to, subject, msg);
            SmtpClient client = new SmtpClient("smtphost");
            client.UseDefaultCredentials = true;
            if (file != null)
            {
                Attachment data = new Attachment(file, MediaTypeNames.Text.Plain);
                mail.Attachments.Add(data);
            }
            try
            {
                client.Send(mail);
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                throw new Exception("Fail to send email: " + ex.Message);
            }
            client.Dispose();
        }

        public static void send(List<string> to, string subject, string msg, string file)
        {
            for (int i = 0; i < to.Count; i++)
                send(to[i], subject, msg, file);
        }
    }
}
