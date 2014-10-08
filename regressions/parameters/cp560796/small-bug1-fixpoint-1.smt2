
(set-info :source | 
Hardware fixpoint check problems.
These benchmarks stem from an evaluation described in Wintersteiger, Hamadi, de Moura: Efficiently solving quantified bit-vector formulas, FMSD 42(1), 2013.
The hardware models that were used are from the VCEGAR benchmark suite (see www.cprover.org/hardware/).
 |)
(set-info :status unknown)
(set-logic BV)

(assert
 (forall ((Verilog__main.impl_flush_64_0 Bool)) (forall ((Verilog__main.impl_flush_64_1 Bool)) (forall ((Verilog__main.impl_PC_valid_64_1 Bool)) (forall ((Verilog__main.reset_64_0 Bool)) (forall ((Verilog__main.impl_PC_valid_64_0 Bool)) (exists ((Verilog__main.impl_flush_64_0_39_ Bool)) (=> (and (= Verilog__main.impl_flush_64_0 false) (= Verilog__main.impl_flush_64_1 false) (= Verilog__main.impl_PC_valid_64_1 (ite Verilog__main.reset_64_0 true (ite Verilog__main.impl_flush_64_0 false Verilog__main.impl_PC_valid_64_0)))) (and (= Verilog__main.impl_flush_64_0_39_ false) (= Verilog__main.impl_flush_64_1 Verilog__main.impl_flush_64_0_39_)))))))))

)
(check-sat)