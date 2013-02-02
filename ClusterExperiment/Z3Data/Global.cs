using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;

namespace Z3Data
{
    public static class Global
    {
        public static CultureInfo culture = new CultureInfo("en-US");

        public static void Say(string text)
        {
            Console.WriteLine(DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString() + ": " + text);
        }
    }
}
