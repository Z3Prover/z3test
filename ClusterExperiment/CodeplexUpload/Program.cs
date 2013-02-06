using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.IO;

using Z3Data;
using CodePlex.WebServices.Client;


namespace CodeplexUpload
{
    class Program
    {
        static bool isNewer(string indicator_file, string file)
        {
            bool res = true;
            if (File.Exists(indicator_file))
            {
                FileStream lf = File.OpenRead(indicator_file);
                StreamReader sr = new StreamReader(lf);
                long last = Convert.ToInt64(sr.ReadLine());
                if (last >= File.GetLastWriteTime(file).ToFileTimeUtc())
                    res = false;
                sr.Close();
                lf.Close();
            }
            if (res)
            {
                // save the date of the binary.        
                FileStream of = File.Create(indicator_file);
                StreamWriter sw = new StreamWriter(of);
                sw.WriteLine(File.GetLastWriteTime(file).ToFileTimeUtc());
                sw.Close();
                of.Close();
            }
            return res;
        }

        static void Main(string[] args)
        {
            Configuration config = new Configuration("config.xml");

            ReleaseService rs = new ReleaseService();
            rs.Credentials = new NetworkCredential(config.codeplex_username, config.codeplex_password);
            rs.Timeout = 600000;

            string releaseWinX86 = "Nightly unstable Windows x86 build";
            string releaseWinX64 = "Nightly unstable Windows x64 build";

            try
            {
                rs.CreateARelease("Z3", releaseWinX86, "Automatic nightly Windows x32 build of the unstable branch.", null, ReleaseStatus.Planned, true, false);
            }
            catch (Exception)
            {
            }

            try
            {
                rs.CreateARelease("Z3", releaseWinX64, "Automatic nightly Windows x64 build of the unstable branch.", null, ReleaseStatus.Planned, true, false);
            }
            catch (Exception)
            {
            }

            DirectoryInfo di = new DirectoryInfo(config.package_dir);
            foreach (FileInfo fi in di.GetFiles("*"))
            {
                if (fi.Name.Contains("z3-win"))
                {
                    if (fi.Name.Contains("-x86"))
                    {
                        if (isNewer("last_cp_win_x86", fi.FullName))
                        {
                            ReleaseFile f = new ReleaseFile();
                            f.Name = fi.Name;
                            f.MimeType = "application/octet-stream";
                            f.FileName = fi.Name;
                            f.FileType = ReleaseFileType.RuntimeBinary;
                            f.FileData = File.ReadAllBytes(fi.FullName);

                            List<ReleaseFile> files = new List<ReleaseFile>();
                            files.Add(f);
                            rs.UploadReleaseFiles("Z3", releaseWinX86, files, f.Name);
                        }
                    }
                    else if (fi.Name.Contains("-x64"))
                    {
                        if (isNewer("last_cp_win_x64", fi.FullName))
                        {
                            ReleaseFile f = new ReleaseFile();
                            f.Name = fi.Name;
                            f.MimeType = "application/octet-stream";
                            f.FileName = fi.Name;
                            f.FileType = ReleaseFileType.RuntimeBinary;
                            f.FileData = File.ReadAllBytes(fi.FullName);

                            List<ReleaseFile> files = new List<ReleaseFile>();
                            files.Add(f);
                            rs.UploadReleaseFiles("Z3", releaseWinX64, files, f.Name);
                        }
                    }
                }
            }
        }
    }
}
