using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.IO;
using System.Data;
using System.Data.OleDb;

using Z3Data;

namespace Nightly
{
    public class Global : System.Web.HttpApplication
    {
        public Configuration config = null;
        public DateTime configDate;        

        internal Configuration Configuration
        {                        
            get
            {
                #if DEBUG
                string fn = "C:\\Nightly\\config.xml";
                #else
                string fn = Properties.Settings.Default.config_file;
                #endif
                
                if (config == null || File.GetLastWriteTime(fn) > configDate)
                {                    
                    config = new Configuration(fn);
                    configDate = File.GetLastWriteTime(fn);
                }
                return config;
            }
        }

        void Application_Start(object sender, EventArgs e)
        {            
            // Code that runs on application startup            
            Application["Configuration"] = Configuration;
        }        

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
