#include<iostream>
#include<sstream>
#include<z3++.h>
using namespace z3;

int error_code = 0;

void check(expr a, char const * expected) {
    std::ostringstream buff;
    buff << a;
    if (buff.str() != expected) {
        std::cerr << "failed, EXPECTED\n" << expected << "\nPRODUCED\n" << buff.str() << "\n";
        error_code = 1;
    }
}

void tst1() {
    context ctx;
    expr a = ctx.int_const("a");
    expr b = ctx.int_const("b");
    expr x = ctx.real_const("x");
    expr y = ctx.real_const("y");
    check(a + b, "(+ a b)");
    check(a + 1, "(+ a 1)");
    check(1 + a, "(+ 1 a)");
    check(a - b, "(- a b)");
    check(a - 1, "(- a 1)");
    check(1 - a, "(- 1 a)");
    check(a * b, "(* a b)");
    check(a * 2, "(* a 2)");
    check(2 * a, "(* 2 a)");
    check(a / b, "(div a b)");
    check(a / 2, "(div a 2)");
    check(2 / a, "(div 2 a)");
    check(x / y, "(/ x y)");
    check(x / 2, "(/ x 2.0)");
    check(2 / x, "(/ 2.0 x)");
    check(a <= b, "(<= a b)");
    check(a <= 1, "(<= a 1)");
    check(1 <= a, "(<= 1 a)");
    check(a >= b, "(>= a b)");
    check(a >= 1, "(>= a 1)");
    check(1 >= a, "(>= 1 a)");
    check(a > b, "(> a b)");
    check(a > 1, "(> a 1)");
    check(1 > a, "(> 1 a)");
    check(a < b, "(< a b)");
    check(a < 1, "(< a 1)");
    check(1 < a, "(< 1 a)");
    check(a == b, "(= a b)");
    check(a == 1, "(= a 1)");
    check(1 == a, "(= 1 a)");
    check(a != b, "(distinct a b)");
    check(a != 1, "(distinct a 1)");
    check(1 != a, "(distinct 1 a)");
    check(pw(x, y), "(^ x y)");
    check(pw(x, 2), "(^ x 2.0)");
    check(pw(2, y), "(^ 2.0 y)");
    check(-a, "(- a)");
}

void tst2() {
    context ctx;
    expr a = ctx.bv_const("a", 8);
    expr b = ctx.bv_const("b", 8);
    check(a + b, "(bvadd a b)");
    check(a + 1, "(bvadd a #x01)");
    check(1 + a, "(bvadd #x01 a)");
    check(a - b, "(bvsub a b)");
    check(a - 1, "(bvsub a #x01)");
    check(1 - a, "(bvsub #x01 a)");
    check(a * b, "(bvmul a b)");
    check(a * 1, "(bvmul a #x01)");
    check(1 * a, "(bvmul #x01 a)");
    check(a / b, "(bvsdiv a b)");
    check(a / 1, "(bvsdiv a #x01)");
    check(1 / a, "(bvsdiv #x01 a)");
    check(udiv(a, b), "(bvudiv a b)");
    check(udiv(a, 1), "(bvudiv a #x01)");
    check(udiv(1, a), "(bvudiv #x01 a)");
    check(a <= b, "(bvsle a b)");
    check(a <= 1, "(bvsle a #x01)");
    check(1 <= a, "(bvsle #x01 a)");
    check(a < b, "(bvslt a b)");
    check(a < 1, "(bvslt a #x01)");
    check(1 < a, "(bvslt #x01 a)");
    check(a >= b, "(bvsge a b)");
    check(a >= 1, "(bvsge a #x01)");
    check(1 >= a, "(bvsge #x01 a)");
    check(a > b, "(bvsgt a b)");
    check(a > 1, "(bvsgt a #x01)");
    check(1 > a, "(bvsgt #x01 a)");
    check(ule(a, b), "(bvule a b)");
    check(ule(a, 1), "(bvule a #x01)");
    check(ule(1, a), "(bvule #x01 a)");
    check(ult(a, b), "(bvult a b)");
    check(ult(a, 1), "(bvult a #x01)");
    check(ult(1, a), "(bvult #x01 a)");
    check(ugt(a, b), "(bvugt a b)");
    check(ugt(a, 1), "(bvugt a #x01)");
    check(ugt(1, a), "(bvugt #x01 a)");
    check(uge(a, b), "(bvuge a b)");
    check(uge(a, 1), "(bvuge a #x01)");
    check(uge(1, a), "(bvuge #x01 a)");
    check(a & b, "(bvand a b)");
    check(a & 1, "(bvand a #x01)");
    check(1 & a, "(bvand #x01 a)");
    check(a | b, "(bvor a b)");
    check(a | 1, "(bvor a #x01)");
    check(1 | a, "(bvor #x01 a)");
    check(~ a, "(bvnot a)");
    check(a ^ b, "(bvxor a b)");
    check(a ^ 1, "(bvxor a #x01)");
    check(1 ^ a, "(bvxor #x01 a)");
}

void tst3() {
    context ctx;
    expr a = ctx.bool_const("a");
    expr b = ctx.bool_const("b");
    check(a && b, "(and a b)");
    check(a && true, "(and a true)");
    check(a && false, "(and a false)");
    check(true && a, "(and true a)");
    check(false && a, "(and false a)");

    check(a || b, "(or a b)");
    check(a || true, "(or a true)");
    check(a || false, "(or a false)");
    check(true || a, "(or true a)");
    check(false || a, "(or false a)");

    check(implies(a, b), "(=> a b)");
    check(implies(a, true), "(=> a true)");
    check(implies(a, false), "(=> a false)");
    check(implies(true, a), "(=> true a)");
    check(implies(false, a), "(=> false a)");

    check(!a, "(not a)");

    expr c = ctx.bool_const("c");
    check(ite(a, b, c), "(ite a b c)");
}

void tst4() {
    context ctx;
    sort I      = ctx.int_sort();
    func_decl f = ctx.function("f", I, I);
    func_decl g = ctx.function("g", I, I, I);
    expr a      = ctx.int_const("a");
    expr b      = ctx.int_const("b");

    check(f(a), "(f a)");
    check(f(2), "(f 2)");
    check(g(a, b), "(g a b)");
    check(g(a, 1), "(g a 1)");
    check(g(1, b), "(g 1 b)");
}

void tst5() {
    context ctx;
    sort I = ctx.int_sort();
    sort A = ctx.array_sort(I, I);
    expr a = ctx.constant("a", A);
    expr i = ctx.constant("i", I);
    expr v = ctx.constant("v", I);
    check(select(a, i), "(select a i)");
    check(select(a, 1), "(select a 1)");
    check(store(a, i, v), "(store a i v)");
    check(store(a, i, 1), "(store a i 1)");
    check(store(a, 1, v), "(store a 1 v)");
    check(store(a, 1, 2), "(store a 1 2)");
    check(const_array(A, i), "((as const (Array (Array Int Int) Int)) i)");
}

void tst6() {
    context ctx;
    check(ctx.int_val(1), "1");
    check(ctx.int_val(-1), "(- 1)");
    check(ctx.int_val("100000000000000000000000000000000000000000000001"), "100000000000000000000000000000000000000000000001");
    check(ctx.int_val(1ull << 48), "281474976710656");
    check(ctx.int_val(static_cast<__uint64>(-1)), "18446744073709551615");
    check(ctx.int_val(-9223372036854775807ll), "(- 9223372036854775807)");
    check(ctx.real_val(1), "1.0");
    check(ctx.real_val(-1), "(- 1.0)");
    check(ctx.real_val("3/2"), "(/ 3.0 2.0)");
    check(ctx.bool_val(true), "true");
    check(ctx.bool_val(false), "false");
    check(ctx.bv_val(1,8), "#x01");
    check(ctx.bv_val(255,8), "#xff");
    check(ctx.bv_val("10",8), "#x0a");
}

int main() {
    tst1();
    tst2();
    tst3();
    tst4();
    tst5();
    tst6();
    return error_code;
}
