using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Input;

using Microsoft.Hpc.Scheduler;
using Microsoft.Hpc.Scheduler.Properties;

namespace ClusterExperiment
{
    class ProgressWorker : BackgroundWorker
    {
        private int total = 0;
        private Progress window = null;

        public ProgressWorker(Progress window, int total)
        {
            this.total = total;
            this.window = window;
            this.WorkerReportsProgress = true;
            this.WorkerSupportsCancellation = true;
            
            ReportProgress(0);
        }        
    }
}
