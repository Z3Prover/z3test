using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Threading;

namespace Z3Data
{
    public class SQLInterface : IDisposable
    {
        uint retryCount = 10;

        public SQLInterface(string connectionString)
        {
            _cString = connectionString;
            _connection = new SqlConnection(_cString);
            EnsureConnected();
        }

        void EnsureConnected()
        {
            if (_connection.State == System.Data.ConnectionState.Open)
                return;

        retry:
            try
            {
                _connection.Open();
            }
            catch (Exception ex)
            {
                Global.Say("Retrying after SQL connection failure: " + ex.Message);
                Thread.Sleep(1000);
                if (--retryCount == 0)
                    throw ex;
                else
                    goto retry;
            }
        }

        public SortedSet<Job> FindJobs(string dataDir, string username)
        {
            SortedSet<Job> res = new SortedSet<Job>();
            SqlCommand cmd = new SqlCommand("SELECT ID FROM Experiments WHERE Creator='" + username + "';", _connection);
            SqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
            {
                uint id = Convert.ToUInt32(r[0]);
                res.Add(new Job(dataDir, id));
            }
            r.Close();
            return res;
        }

        public void Query(string cmdString)
        {
        retry:
            try
            {
                EnsureConnected();
                SqlCommand cmd = new SqlCommand(cmdString, _connection);
                cmd.CommandTimeout = 0;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                if (ex.Number == -2) /* timeout */ goto retry; else throw ex;
            }
        }

        public SqlDataReader GetReader(string cmdString)
        {
            EnsureConnected();
            SqlCommand cmd = new SqlCommand(cmdString, _connection);
            cmd.CommandTimeout = 0;
            return cmd.ExecuteReader();
        }

        public Dictionary<string, Object> Read(string cmdString)
        {
            SqlCommand cmd = null;
            SqlDataReader r = null;

            bool has_data = false;
        retry_read:
            try
            {
                EnsureConnected();
                cmd = new SqlCommand(cmdString, _connection);
                cmd.CommandTimeout = 0;
                r = cmd.ExecuteReader();
                has_data = r.Read();
            }
            catch (Exception ex)
            {
                if (r != null) r.Close();
                if (cmd != null) cmd.Cancel();
                Global.Say("Retrying after SQL read failure: " + ex.Message);
                goto retry_read;
            }


            Dictionary<string, Object> res = new Dictionary<string, Object>();

            if (has_data)
            {
                for (int i = 0; i < r.FieldCount; i++)
                    res[r.GetName(i)] = r[i];
            }

        retry:
            try
            {
                r.Close();
            }
            catch (Exception ex)
            {
                Global.Say("Retrying after SQL Exception in reader.Close(): " + ex.Message);
                goto retry;
            }

            return res;
        }

        public static int getint(ref SqlDataReader r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? 0 : Convert.ToInt32(q);
        }

        public static uint getuint(ref SqlDataReader r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? 0 : Convert.ToUInt32(q);
        }

        public static string getstring(ref SqlDataReader r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? "" : (string)q;
        }

        public static double getdouble(ref SqlDataReader r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? 0.0 : Convert.ToDouble(q);
        }

        public static int getint(ref Dictionary<string, object> r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? 0 : Convert.ToInt32(q);
        }

        public static uint getuint(ref Dictionary<string, object> r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? 0 : Convert.ToUInt32(q);
        }

        public static string getstring(ref Dictionary<string, object> r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? "" : Convert.ToString(q);
        }

        public static double getdouble(ref Dictionary<string, object> r, string inx)
        {
            object q = r[inx];
            return (DBNull.Value.Equals(q)) ? 0.0 : Convert.ToDouble(q);
        }


        public void Dispose()
        {
            if (_connection != null)
                _connection.Close();
            _connection = null;
        }

        string _cString = null;
        SqlConnection _connection = null;
    }
}
