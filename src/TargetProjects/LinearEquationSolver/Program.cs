using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Angara.Data;
using Angara.Data.DelimitedFile;
using MathNet.Numerics.LinearAlgebra;
using Microsoft.FSharp.Core;
using MathNet.Numerics.LinearAlgebra.Solvers;
using MathNet.Numerics.LinearAlgebra.Double.Solvers;

namespace LinearEquationSolver
{
    class Program
    {
        static int Main(string[] args)
        {
            if(args.Length < 1 || args.Length > 2)
            {
                Console.WriteLine("Use: LinearEquationSolver.exe <matrix.csv> [<number-of-iterations>]");
                return 2;
            }

            Table table = Table.Load(args[0], new ReadSettings(Delimiter.Comma, false, false, FSharpOption<int>.None, ReadSettings.Default.ColumnTypes));
            if (table.Count <= 1) throw new Exception("Expecting 2 or more columns");


            var n = args.Length >= 2 ? int.Parse(args[1]) : 1;
            
            var columns = table.Select(column => column.Rows.AsReal as IEnumerable<double>);
            var A = Matrix<double>.Build.DenseOfColumns(columns.Where((_,i) => i < table.Count - 1));
            var b = Vector<double>.Build.DenseOfEnumerable(columns.Last());

            var iterationCountStopCriterion = new IterationCountStopCriterion<double>(1000);
            var residualStopCriterion = new ResidualStopCriterion<double>(1e-10);
            var monitor = new Iterator<double>(iterationCountStopCriterion, residualStopCriterion);
            var solver = new CompositeSolver(SolverSetup<double>.LoadFromAssembly(System.Reflection.Assembly.GetExecutingAssembly()));

            Vector<double> x = null;
            for (var i = 0; i < n; i++)
            {
                //x = A.Solve(b);
                x = A.SolveIterative(b, solver, monitor);
            }

            Table result = Table.OfColumns(new[] { Column.Create("x", x.ToArray(), FSharpOption<int>.None) });
            Table.Save(result, "result.csv");

            return 0;
        }
    }

    public class UserBiCgStab : IIterativeSolverSetup<double>
    {
        /// <summary>
        /// Gets the type of the solver that will be created by this setup object.
        /// </summary>
        public Type SolverType
        {
            get { return null; }
        }

        /// <summary>
        /// Gets type of preconditioner, if any, that will be created by this setup object.
        /// </summary>
        public Type PreconditionerType
        {
            get { return null; }
        }

        /// <summary>
        /// Creates a fully functional iterative solver with the default settings
        /// given by this setup.
        /// </summary>
        /// <returns>A new <see cref="IIterativeSolver{T}"/>.</returns>
        public IIterativeSolver<double> CreateSolver()
        {
            return new BiCgStab();
        }

        public IPreconditioner<double> CreatePreconditioner()
        {
            return null;
        }

        /// <summary>
        /// Gets the relative speed of the solver.
        /// </summary>
        /// <value>Returns a value between 0 and 1, inclusive.</value>
        public double SolutionSpeed
        {
            get { return 0.99; }
        }

        /// <summary>
        /// Gets the relative reliability of the solver.
        /// </summary>
        /// <value>Returns a value between 0 and 1 inclusive.</value>
        public double Reliability
        {
            get { return 0.99; }
        }
    }
}
