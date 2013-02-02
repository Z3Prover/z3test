using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Diagnostics;

namespace TestZ3
{
  class Execution
  {
    public static TimeSpan time(Process p)
    {
      // Wallclock time
      //return DateTime.Now - p.StartTime;

      // Process time
      return p.TotalProcessorTime;

      // Complicated multi-process time. Note that sub-processes may be unavailable after the main process has exited. 
      //TimeSpan r = new TimeSpan(0);      

      //foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
      //  r += cp.TotalProcessorTime;

      //return r;
    }

    public static long memory(Process p)
    {
      long r = 0;

      foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
        try
        {
          r += cp.PeakVirtualMemorySize64;
        }
        catch
        {
          // Ignore; could be access is denied
        }

      return r;
    }

    public static void kill(Process p)
    {
    retry:
      try
      {
        foreach (Process cp in Process.GetProcessesByName(p.ProcessName))
          cp.Kill();
      }
      catch
      {
        goto retry; // could be access denied
      }
    }
  }
}
