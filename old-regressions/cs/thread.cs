using Microsoft.Z3;
using System;
using System.Threading;
using System.Collections.Generic;

class Test
{
    class Worker
    {
        class WorkerException : Exception
        {
            public WorkerException(string s) : base(s) {}
        }

        int _inx;
        int _num;
        Context _ctx = null;
        public List<Expr> result = new List<Expr>();

        public Worker(int inx, int num) 
        {
            _inx = inx;
            _num = num;
            Dictionary<string, string> cfg = new Dictionary<string, string>() { 
                { "AUTO_CONFIG", "true" } };
            _ctx = new Context(cfg);
        }

        public void Run()
        {
            for (int i = 0; i < _num; i++)
                result.Add(_ctx.MkIntConst(string.Format("x_{0}_{1}", _inx, i)));
            for (int i = 0; i < _num; i++)
                if (result[i].FuncDecl.Name.ToString() != string.Format("x_{0}_{1}", _inx, i))
                    throw new WorkerException("name mismatch");
        }
    }

    public void Run()
    {
        const int num_workers = 4;
        Worker[] workers = new Worker[num_workers];
        Thread[] threads = new Thread[num_workers];

        for (int i = 0; i < num_workers; i++)
        {
            workers[i] = new Worker(i, 50);
            threads[i] = new Thread(workers[i].Run);
            threads[i].Start();
        }

        foreach (Thread t in threads)
            t.Join();

        foreach (Worker w in workers)
        {
            foreach (Expr e in w.result)
                Console.Write(" " + e);
            Console.WriteLine();
        }

        Console.WriteLine("done");
    }
}