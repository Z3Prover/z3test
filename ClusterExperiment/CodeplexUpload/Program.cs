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
                if (last >= File.GetCreationTimeUtc(file).ToFileTimeUtc())
                    res = false;
                sr.Close();
                lf.Close();
            }
            if (res)
            {
                // save the date of the binary.        
                FileStream of = File.Create(indicator_file);
                StreamWriter sw = new StreamWriter(of);
                sw.WriteLine(File.GetCreationTimeUtc(file).ToFileTimeUtc());
                sw.Close();
                of.Close();
            }
            return res;
        }

        static void mkRelease(ReleaseService rs, string name, string description)
        {
            try
            {
                rs.CreateARelease("Z3", name, description, null, ReleaseStatus.Planned, true, false);
            }
            catch (Exception)
            {
            }
        }

        static void upload(ReleaseService rs, FileInfo fi, string release, string checkfile)
        {
            if (isNewer(checkfile, fi.FullName))
            {
                ReleaseFile f = new ReleaseFile();
                f.Name = fi.Name;
                f.MimeType = "application/octet-stream";
                f.FileName = fi.Name;
                f.FileType = ReleaseFileType.RuntimeBinary;
                f.FileData = File.ReadAllBytes(fi.FullName);

                List<ReleaseFile> files = new List<ReleaseFile>();
                files.Add(f);
                rs.UploadReleaseFiles("Z3", release, files, f.Name);
            }
        }

        static void Main(string[] args)
        {
            Configuration config = new Configuration("config.xml");

            ReleaseService rs = new ReleaseService();
            rs.Credentials = new NetworkCredential(config.codeplex_username, config.codeplex_password);
            rs.Timeout = 600000;

            string releaseWinX86 = "Windows x86 unstable";
            string releaseWinX64 = "Windows x64 unstable";
            string releaseDebianX64 = "Debian x64 unstable";
            string releaseFreeBSDX64 = "FreeBSD x64 unstable";
            string releaseOSX = "OSX x64 unstable";
            string releaseUbuntuX64 = "Ubuntu x64 unstable";
            string releaseUbuntuX86 = "Ubuntu x86 unstable";
            

            DirectoryInfo di = new DirectoryInfo(config.package_dir);
            foreach (FileInfo fi in di.GetFiles("*"))
            {
                if (fi.Name.Contains("-x86-win"))
                {
                    mkRelease(rs, releaseWinX86, "Automatic nightly Windows x32 build of the unstable branch.");
                    upload(rs, fi, releaseWinX86, "last_cp_win_x86");
                }
                else if (fi.Name.Contains("-x64-win"))
                {
                    mkRelease(rs, releaseWinX64, "Automatic nightly Windows x64 build of the unstable branch.");
                    upload(rs, fi, releaseWinX64, "last_cp_win_x64");
                }
                else if (fi.Name.Contains("-x64-debian"))
                {
                    mkRelease(rs, releaseDebianX64, "Automatic nightly Debian x64 build of the unstable branch.");
                    upload(rs, fi, releaseDebianX64, "last_cp_debian_x64");
                }
                else if (fi.Name.Contains("-x64-freebsd"))
                {
                    mkRelease(rs, releaseFreeBSDX64, "Automatic nightly FreeBSD x64 build of the unstable branch.");
                    upload(rs, fi, releaseFreeBSDX64, "last_cp_freebsd_x64");
                }
                else if (fi.Name.Contains("-x64-ubuntu"))
                {
                    mkRelease(rs, releaseUbuntuX64, "Automatic nightly Ubuntu x64 build of the unstable branch.");
                    upload(rs, fi, releaseUbuntuX64, "last_cp_ubuntu_x64");
                }
                else if (fi.Name.Contains("-x86-ubuntu"))
                {
                    mkRelease(rs, releaseUbuntuX86, "Automatic nightly Ubuntu x86 build of the unstable branch.");
                    upload(rs, fi, releaseUbuntuX86, "last_cp_ubuntu_x86");
                }
                else if (fi.Name.Contains("-x64-osx"))
                {
                    mkRelease(rs, releaseOSX, "Automatic nightly OSX x64 build of the unstable branch.");
                    upload(rs, fi, releaseOSX, "last_cp_osx_x64");
                }
            }
        }
    }
}
