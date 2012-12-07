from z3 import *
set_option(auto_config=True)

Registers_State=Datatype ('Registers_State')
Registers_State.declare('cons', ('A', IntSort()), ('B', IntSort()), ('C', IntSort()))
Registers_State=Registers_State.create()

Operation, (mult, minus, plus) = EnumSort('Operation', ('mult', 'minus', 'plus'))

Register, (A, B, C) = EnumSort('Register', ('A', 'B', 'C'))

def register_selector (register, input_registers): # Register, Registers_State -> int
    return If(register==A, Registers_State.A(input_registers),
           If(register==B, Registers_State.B(input_registers), 
           If(register==C, Registers_State.C(input_registers), 
                           0))) # default

# Bool Register, Registers_State, int -> int
def register_or_constant_selector (register_or_constant, register, input_registers, constant): 
    return If(register_or_constant==False, register_selector(register, input_registers), constant)

# Operation, Bool, Register, Register, Int, Registers_State -> int
def one_op (op, register_or_constant, reg1, reg2, constant, input_registers):
    arg1=register_selector(reg1, input_registers)
    arg2=register_or_constant_selector (register_or_constant, reg2, input_registers, constant)
    return If(op==mult,  arg1*arg2,
           If(op==minus, arg1-arg2,
           If(op==plus,  arg1+arg2, 
                         0))) # default

# Bool, Register, Operation, Register, Register, Int, Registers_State -> Registers_State
def one_step (register_or_constant, register_assigned_in_this_step, op, reg1, reg2, constant, input_registers):
    new_val=one_op(op, register_or_constant, reg1, reg2, constant, input_registers)
    return If (register_assigned_in_this_step==A, Registers_State.cons (new_val,
                                                                        Registers_State.B(input_registers), 
                                                                        Registers_State.C(input_registers)),
           If (register_assigned_in_this_step==B, Registers_State.cons (Registers_State.A(input_registers), 
                                                                        new_val,
                                                                        Registers_State.C(input_registers)), 
           If (register_assigned_in_this_step==C, Registers_State.cons (Registers_State.A(input_registers), 
                                                                        Registers_State.B(input_registers), 
                                                                        new_val), 
                                                  Registers_State.cons(0,0,0)))) # default

s=Solver()

# test of one_step (register_or_constant, register_modified_in_this_step, op, reg1, reg2, constant, input_registers):

register_or_constant=Bool ('register_or_constant')
unk_op=Const ('unk_op', Operation)
register_modified_in_this_step=Const ('register_modified_in_this_step', Register)
reg1=Const ('reg1', Register)
reg2=Const ('reg2', Register)
constant=Int('constant')
s.add(constant>0)
s.add (one_step (register_or_constant, register_modified_in_this_step, unk_op, reg1, reg2, constant, Registers_State.cons(11,2,6))==Registers_State.cons(11,3,6))
s.add (one_step (register_or_constant, register_modified_in_this_step, unk_op, reg1, reg2, constant, Registers_State.cons(6,6,0))==Registers_State.cons(6, 7, 0))
s.add (one_step (register_or_constant, register_modified_in_this_step, unk_op, reg1, reg2, constant, Registers_State.cons(1,1,6))==Registers_State.cons(1, 2, 6))
s.add (one_step (register_or_constant, register_modified_in_this_step, unk_op, reg1, reg2, constant, Registers_State.cons(1,66,100))==Registers_State.cons(1, 67, 100))

tmp=s.check()
if tmp==sat:
    m=s.model()
    print m
else:
    print tmp
