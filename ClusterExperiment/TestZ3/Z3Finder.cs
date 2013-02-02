using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace TestZ3
{
    class Z3Finder
    {
        public static void checkForNewerZ3(DirectoryInfo dir, string z3exe, ref DateTime newest, ref string where)
        {
            // Console.WriteLine("Searching for Z3 at: " + dir.FullName);

            FileInfo[] files = dir.GetFiles(z3exe);
            foreach (FileInfo file in files)
            {
                DateTime curr = file.CreationTime;
                if (curr > newest)
                {
                    newest = curr;
                    where = file.DirectoryName + @"\" + file.Name;
                    // Console.WriteLine("newer binary: " + where);
                }
            }
        }

        public static bool findZ3(string dropDir, string rd, string z3exe, DateTime oldTime, ref string where, bool check_subdirs = true)
        {
            DateTime best = new DateTime(1900, 1, 1);
            DirectoryInfo di = new DirectoryInfo(dropDir);
            bool found = false;

            //if (rd == "")
            //    rd = "*";

            if (check_subdirs)
            {
                DirectoryInfo[] subDirs = di.GetDirectories();
                for (int i = 0; i < subDirs.Length; i++)
                {
                    DirectoryInfo subDir = subDirs[i];
                    string subDirRd = subDir.FullName + @"\" + rd;
                    if (Directory.Exists(subDirRd))
                        found = findZ3(subDirRd, "", z3exe, best, ref where, false);
                }
            }
            else
            {
                checkForNewerZ3(di, z3exe, ref best, ref where);
                found = best > oldTime;
            }

            //if (dropDir.EndsWith(rd))
            //{
            //    checkForNewerZ3(di, z3exe, ref best, ref where);
            //    found = best > oldTime;
            //}

            // copy locally?

            return found;
        }
    }
}
