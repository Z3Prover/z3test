using Microsoft.Z3;
using System;
      
class TestDriver
{
    class TestFailedException : Exception
    {
        public TestFailedException() : base() { }
        public TestFailedException(string s) : base(s) { }
    }

    public static void CheckString(Expr e, string s)
    {
        if (e.ToString() != s)
            throw new TestFailedException("strings don't match");
    }

    public static void CheckAssertion(string s, bool f)
    {
        if(!f)
           throw new TestFailedException(string.Format("Assertion failed {0}", s));
    }

    public static void CheckSAT(Status s)
    {
        if (s != Status.SATISFIABLE)
            throw new TestFailedException("result was not SATISFIABLE");
    }

    public static void CheckUNSAT(Status s)
    {
        if (s != Status.UNSATISFIABLE)
            throw new TestFailedException("result was not UNSATISFIABLE");
    }
       
    public static int Main()
    {
        try
        {
            Test test = new Test();
            test.Run();
        }
        catch (Exception e)
        {
            Console.WriteLine("Test failed; Exception: " + e.Message);
            return 1;
        }

        return 0;
    }
}