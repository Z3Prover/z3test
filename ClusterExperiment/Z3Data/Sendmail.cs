using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;

namespace Z3Data
{
    public class Sendmail
    {
        static string domain = "@microsoft.com";
        static uint retryCount = 3;

        public static void Send(string to, string subject, string msg, string file, Dictionary<string,string> images = null, bool html = false)
        {
            MailMessage mail = new MailMessage(Environment.UserName + domain, to, subject, msg);
            SmtpClient client = new SmtpClient("smtphost");
            client.UseDefaultCredentials = true;
            mail.IsBodyHtml = html;

            if (images != null)
            {
                foreach (KeyValuePair<string, string> kvp in images)
                {
                    Attachment a = new Attachment(kvp.Value);
                    a.ContentDisposition.Inline = true;
                    a.ContentDisposition.DispositionType = DispositionTypeNames.Inline;
                    a.ContentId = kvp.Key;
                    a.ContentType.MediaType = "image/" + Path.GetExtension(kvp.Value);
                    a.ContentType.Name = Path.GetFileName(kvp.Value);
                    mail.Attachments.Add(a);
                }
            }

            if (file != null)
            {
                Attachment data = new Attachment(file, MediaTypeNames.Text.Plain);
                mail.Attachments.Add(data);
            }

            uint retries = 0;
            bool sent = false;
            while (!sent)
            {
                try
                {
                    client.Send(mail);
                    sent = true;
                }
                catch (System.Net.Mail.SmtpException ex)
                {
                    retries++;
                    if (retries == retryCount)
                        throw new Exception("Failed to send email: " + ex.Message);
                }
            }
            client.Dispose();
        }

        public static void Send(List<string> to, string subject, string msg, string file, Dictionary<string,string> images = null, bool html = false)
        {
            foreach (string rec in to)
                Send(rec, subject, msg, file, images, html);
        }
    }
}
