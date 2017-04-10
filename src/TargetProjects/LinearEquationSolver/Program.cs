using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Angara.Data;
using Angara.Data.DelimitedFile;
using MathNet.Numerics.LinearAlgebra;
using Microsoft.FSharp.Core;

namespace LinearEquationSolver
{
    class Program
    {
        static int Main(string[] args)
        {
            if(args.Length != 1)
            {
                Console.WriteLine("Use: LinearEquationSolver.exe <matrix.csv>");
                return 2;
            }

            Table table = Table.Load(args[0], new ReadSettings(Delimiter.Comma, false, false, FSharpOption<int>.None, ReadSettings.Default.ColumnTypes));
            if (table.Count <= 1) throw new Exception("Expecting 2 or more columns");

            var columns = table.Select(column => column.Rows.AsReal as IEnumerable<double>);
            var A = Matrix<double>.Build.DenseOfColumns(columns.Where((_,i) => i < table.Count - 1));
            var b = Vector<double>.Build.DenseOfEnumerable(columns.Last());
            var x = A.Solve(b);

            Table result = Table.OfColumns(new[] { Column.Create("x", x.ToArray(), FSharpOption<int>.None) });
            Table.Save(result, "result.csv");

            return 0;
        }
    }
}
