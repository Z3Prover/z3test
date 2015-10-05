
/*++
Copyright (c) 2015 Microsoft Corporation

--*/

using Microsoft.Z3;
using System;
using System.Collections.Generic;

class Car
{
    public bool is_vertical;
    public int base_pos;
    public int length;
    public int start;
    public string color;

    public Car(bool is_vertical, int base_pos, int length, int start, string color)
    {
        this.is_vertical = is_vertical;
        this.base_pos = base_pos;
        this.length = length;
        this.start = start;
        this.color = color;
    }

    public override bool Equals(Object other)
    {
        return (other is Car) && this.color == ((Car)other).color;
    }

    public override int GetHashCode() { 
        return this.color.GetHashCode(); 
    }
}


class Test
{
    const int dimension = 6;
    Car red_car;
    Car[] cars;
    int num_cars;
    Sort B;
    Sort bv3;
    FuncDecl state;
    Fixedpoint fp;
    Context ctx;


    Expr num(int i) { return ctx.MkNumeral(i, bv3); }


    Expr bound(int i) { return ctx.MkBound((uint)i, bv3); }


    void mk_transition(int row, int col, int i0, int j, int pos)
    {
        Car car0 = cars[pos];
        List<BoolExpr> body = new List<BoolExpr>();
        body.Add(mk_state(car0, i0));
        for (int index = 0; index < num_cars; ++index)
        {
            Car car = cars[index];
            if (car0 != car)
            {
                if (car.is_vertical && car.base_pos == col)
                    for (int i = 0; i < dimension; ++i)
                        if (i <= row && row < i + car.length && i + car.length <= dimension)
                            body.Add(ctx.MkNot(ctx.MkEq(bound(index), num(i))));
                if (car.base_pos == row && !car.is_vertical)
                    for (int i = 0; i < dimension; ++i)
                        if (i <= col && col < i + car.length && i + car.length <= dimension)
                            body.Add(ctx.MkNot(ctx.MkEq(bound(index), num(i))));
            }
        }
        Symbol s = ctx.MkSymbol(string.Format("{0} {1}->{2}", car0.color, i0, j));

        fp.AddRule(ctx.MkImplies(ctx.MkAnd(body.ToArray()), mk_state(car0, j)), s);
    }

    BoolExpr mk_state(Car car, int value)
    {
        List<Expr> args = new List<Expr>();
        for (int i = 0; i < num_cars; ++i)
        {
            if (cars[i] == car)
                args.Add(num(value));
            else args.Add(bound(i));
        }
        return (BoolExpr)(state[args.ToArray()]);
    }

    void move_down(int i, int pos, Car car)
    {
        int free_row = i + car.length;
        if (free_row < dimension)
            mk_transition(free_row, car.base_pos, i, i + 1, pos);
    }


    void move_up(int i, int pos, Car car)
    {
        int free_row = i - 1;
        if (0 <= free_row && i + car.length <= dimension)
            mk_transition(free_row, car.base_pos, i, i - 1, pos);
    }

    void move_left(int i, int pos, Car car)
    {
        int free_col = i - 1;
        if (0 <= free_col && i + car.length <= dimension)
            mk_transition(car.base_pos, free_col, i, i - 1, pos);
    }


    void move_right(int i, int pos, Car car)
    {
        int free_col = car.length + i;
        if (free_col < dimension)
            mk_transition(car.base_pos, free_col, i, i + 1, pos);
    }

    void get_instructions(Expr ans)
    {
        Expr lastAnd = ans.Args[0].Args[ans.Args[0].NumArgs - 1];
        Expr trace = lastAnd.Args[1];
        while (trace.NumArgs > 0)
        {
            Console.WriteLine("{0}", trace.FuncDecl.Name);
            trace = trace.Args[trace.NumArgs - 1];
        }
    }

    public void Run()
    {
        using (Context ctx = new Context())
        {
            this.ctx = ctx;
            ctx.UpdateParamValue("DL_GENERATE_EXPLANATIONS", "true");

            red_car = new Car(false, 2, 2, 3, "red");
            cars = new Car[]{
                new Car(true, 0, 3, 0, "yellow"),
                new Car(false, 3, 3, 0, "blue"),
                new Car(false, 5, 2, 0, "brown"),
                new Car(false, 0, 2, 1, "lgreen"),
                new Car(true,  1, 2, 1, "light blue"),
                new Car(true,  2, 2, 1, "pink"),
                new Car(true,  2, 2, 4, "dark green"),
                red_car,
                new Car(true,  3, 2, 3, "purple"),
                new Car(false, 5, 2, 3, "light yellow"),
                new Car(true,  4, 2, 0, "orange"),
                new Car(false, 4, 2, 4, "black"),
                new Car(true,  5, 3, 1, "light purple")
                };

            this.num_cars = cars.Length;
            this.B = ctx.MkBoolSort();
            this.bv3 = ctx.MkBitVecSort(3);
            List<Sort> domain = new List<Sort>();
            foreach (var c in cars) domain.Add(bv3);
            this.state = ctx.MkFuncDecl("state", domain.ToArray(), B);
            this.fp = ctx.MkFixedpoint();
            this.fp.RegisterRelation(state);


            // Initial state:

            Expr[] args = new Expr[num_cars];
            for (int i = 0; i < num_cars; ++i) args[i] = num(cars[i].start);
            fp.AddRule((BoolExpr)state[args]);

            // Transitions:
            for (int pos = 0; pos < num_cars; ++pos)
            {
                Car car = cars[pos];
                for (int i = 0; i < dimension; ++i)
                    if (car.is_vertical)
                    {
                        move_down(i, pos, car);
                        move_up(i, pos, car);
                    }
                    else
                    {
                        move_left(i, pos, car);
                        move_right(i, pos, car);
                    }
            }

            // Print the current context:
            Console.WriteLine("{0}", fp);

            // Prepare the query:
            for (int i = 0; i < num_cars; ++i) args[i] = (cars[i] == red_car) ? num(4) : bound(i);
            BoolExpr goal = (BoolExpr)state[args];
            fp.Query(goal);

            // Extract a path:
            get_instructions(fp.GetAnswer());
        }
    }

/*
    static void Main()
    {
        Test t = new Test();
        t.Run();
    }
*/
}
