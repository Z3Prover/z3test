(set-info :smt-lib-version 2.6)
(set-logic AUFLIA)
(set-info :source |Generator: Rodin SMT Plug-in|)
(set-info :license "https://creativecommons.org/licenses/by-nc/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

(declare-sort ABSTRACT_TM_SIZES 0)
(declare-sort ENQUEUEABLE_ELEMENTS 0)
(declare-sort PACKET_START_ADDRESSES_IN_TC_BUFFER 0)
(declare-sort PACKET_START_ADDRESSES_IN_TC_POOL 0)
(declare-sort PACKET_START_ADDRESSES_IN_TM_BUFFER 0)
(declare-sort PACKET_START_ADDRESSES_IN_TM_POOL 0)
(declare-sort PE 0)
(declare-sort PIDS 0)
(declare-sort PP1 0)
(declare-sort PQ 0)
(declare-sort PZ 0)
(declare-sort QUEUES 0)
(declare-sort TC_SET 0)
(declare-sort TC_STATUSES 0)
(declare-sort TM_PRIORITIES 0)
(declare-sort TM_SET 0)
(declare-sort TM_STATUSES 0)
(declare-fun Abstract_Size_of_TM (TM_SET ABSTRACT_TM_SIZES) Bool)
(declare-fun Abstract_Slot_Size_in_TM_Pool (PACKET_START_ADDRESSES_IN_TM_POOL ABSTRACT_TM_SIZES) Bool)
(declare-fun Dequeue (QUEUES QUEUES) Bool)
(declare-fun Duplicate_Elements_of_Queue (QUEUES PE) Bool)
(declare-fun Elements_of_Queue (QUEUES PE) Bool)
(declare-fun Enqueue (ENQUEUEABLE_ELEMENTS QUEUES QUEUES) Bool)
(declare-fun Head_of_Queue (QUEUES ENQUEUEABLE_ELEMENTS) Bool)
(declare-fun Length_of_Queue (QUEUES Int) Bool)
(declare-fun MS (PIDS PP1) Bool)
(declare-fun MS0 (QUEUES PQ) Bool)
(declare-fun MS1 (ENQUEUEABLE_ELEMENTS PE) Bool)
(declare-fun MS2 (Int PZ) Bool)
(declare-fun Pid_of_TC (TC_SET PIDS) Bool)
(declare-fun Pid_of_TM (TM_SET PIDS) Bool)
(declare-fun Priority_of_TM (TM_SET TM_PRIORITIES) Bool)
(declare-fun Queues_of_Length (Int PQ) Bool)
(declare-fun Slot_Pids_in_TM_Pool (PACKET_START_ADDRESSES_IN_TM_POOL PP1) Bool)
(declare-fun Slot_Priority_in_TM_Pool (PACKET_START_ADDRESSES_IN_TM_POOL TM_PRIORITIES) Bool)
(declare-fun TC_Buffer_Element_Address (ENQUEUEABLE_ELEMENTS PACKET_START_ADDRESSES_IN_TC_BUFFER) Bool)
(declare-fun TC_Pool_Element_Address (ENQUEUEABLE_ELEMENTS PACKET_START_ADDRESSES_IN_TC_POOL) Bool)
(declare-fun TM_Buffer_Element_Address (ENQUEUEABLE_ELEMENTS PACKET_START_ADDRESSES_IN_TM_BUFFER) Bool)
(declare-fun TM_Pool_Element_Address (ENQUEUEABLE_ELEMENTS PACKET_START_ADDRESSES_IN_TM_POOL) Bool)
(declare-fun VALID_TCS (TC_SET) Bool)
(declare-fun ASW_PIDS () PP1)
(declare-fun ENQUEUEABLE_TC_BUFFER_ELEMENTS () PE)
(declare-fun ENQUEUEABLE_TC_POOL_ELEMENTS () PE)
(declare-fun ENQUEUEABLE_TM_BUFFER_ELEMENTS () PE)
(declare-fun ENQUEUEABLE_TM_POOL_ELEMENTS () PE)
(declare-fun Empty_Queue () QUEUES)
(declare-fun High_Priority_TM () TM_PRIORITIES)
(declare-fun Long_TM () ABSTRACT_TM_SIZES)
(declare-fun Low_Priority_TM () TM_PRIORITIES)
(declare-fun MAGIC_LENGTHS () PZ)
(declare-fun Medium_Priority_TM () TM_PRIORITIES)
(declare-fun Short_TM () ABSTRACT_TM_SIZES)
(declare-fun TC_Accepted () TC_STATUSES)
(declare-fun TC_Execution_Failed () TC_STATUSES)
(declare-fun TC_Rejected () TC_STATUSES)
(declare-fun TC_Removable () TC_STATUSES)
(declare-fun TC_Successfully_Executed () TC_STATUSES)
(declare-fun TC_Unchecked () TC_STATUSES)
(declare-fun TC_Waiting_for_Execution () TC_STATUSES)
(declare-fun TM_Effective () TM_STATUSES)
(declare-fun TM_Removable () TM_STATUSES)
(declare-fun csw () PIDS)
(declare-fun mixsc () PIDS)
(declare-fun mixst () PIDS)
(declare-fun q () QUEUES)
(declare-fun sixsp () PIDS)
(declare-fun sixsx () PIDS)

; Elementary Sets axiom (Singleton part)
(assert (forall ((x319 Int)) 
            (exists ((X PZ)) 
                (and 
                    (MS2 x319 X) 
                    (forall ((y Int)) 
                        (=> 
                            (MS2 y X) 
                            (= y x319)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x320 QUEUES)) 
            (exists ((X0 PQ)) 
                (and 
                    (MS0 x320 X0) 
                    (forall ((y0 QUEUES)) 
                        (=> 
                            (MS0 y0 X0) 
                            (= y0 x320)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x321 ENQUEUEABLE_ELEMENTS)) 
            (exists ((X1 PE)) 
                (and 
                    (MS1 x321 X1) 
                    (forall ((y1 ENQUEUEABLE_ELEMENTS)) 
                        (=> 
                            (MS1 y1 X1) 
                            (= y1 x321)))))))
; Elementary Sets axiom (Singleton part)
(assert (forall ((x322 PIDS)) 
            (exists ((X2 PP1)) 
                (and 
                    (MS x322 X2) 
                    (forall ((y2 PIDS)) 
                        (=> 
                            (MS y2 X2) 
                            (= y2 x322)))))))
(assert (! (forall ((x TC_STATUSES)) 
               (or 
                   (= x TC_Unchecked) 
                   (= x TC_Accepted) 
                   (= x TC_Rejected) 
                   (= x TC_Waiting_for_Execution) 
                   (= x TC_Successfully_Executed) 
                   (= x TC_Execution_Failed) 
                   (= x TC_Removable)))
         :named hyp1))
(assert (! (forall ((x0 TM_STATUSES)) 
               (or 
                   (= x0 TM_Effective) 
                   (= x0 TM_Removable)))
         :named hyp2))
(assert (! (forall ((x1 PIDS)) 
               (or 
                   (= x1 csw) 
                   (= x1 mixsc) 
                   (= x1 mixst) 
                   (= x1 sixsp) 
                   (= x1 sixsx)))
         :named hyp3))
(assert (! (forall ((x2 PIDS)) 
               (= 
                   (MS x2 ASW_PIDS) 
                   (not 
                       (= x2 csw))))
         :named hyp4))
(assert (! (and 
               (forall ((x3 TC_SET) (x4 PIDS)) 
                   (=> 
                       (Pid_of_TC x3 x4) 
                       (VALID_TCS x3))) 
               (forall ((x5 TC_SET) (x6 PIDS) (x7 PIDS)) 
                   (=> 
                       (and 
                           (Pid_of_TC x5 x6) 
                           (Pid_of_TC x5 x7)) 
                       (= x6 x7))) 
               (forall ((x8 TC_SET)) 
                   (=> 
                       (VALID_TCS x8) 
                       (exists ((x9 PIDS)) 
                           (Pid_of_TC x8 x9)))) 
               (forall ((x10 PIDS)) 
                   (exists ((x11 TC_SET)) 
                       (Pid_of_TC x11 x10))))
         :named hyp5))
(assert (! (and 
               (forall ((x12 TM_SET) (x13 PIDS) (x14 PIDS)) 
                   (=> 
                       (and 
                           (Pid_of_TM x12 x13) 
                           (Pid_of_TM x12 x14)) 
                       (= x13 x14))) 
               (forall ((x15 TM_SET)) 
                   (exists ((x16 PIDS)) 
                       (Pid_of_TM x15 x16))) 
               (forall ((x17 PIDS)) 
                   (exists ((x18 TM_SET)) 
                       (Pid_of_TM x18 x17))))
         :named hyp6))
(assert (! (forall ((x19 TM_PRIORITIES)) 
               (or 
                   (= x19 High_Priority_TM) 
                   (= x19 Medium_Priority_TM) 
                   (= x19 Low_Priority_TM)))
         :named hyp7))
(assert (! (forall ((x20 ABSTRACT_TM_SIZES)) 
               (or 
                   (= x20 Short_TM) 
                   (= x20 Long_TM)))
         :named hyp8))
(assert (! (and 
               (forall ((x21 TM_SET) (x22 TM_PRIORITIES) (x23 TM_PRIORITIES)) 
                   (=> 
                       (and 
                           (Priority_of_TM x21 x22) 
                           (Priority_of_TM x21 x23)) 
                       (= x22 x23))) 
               (forall ((x24 TM_SET)) 
                   (exists ((x25 TM_PRIORITIES)) 
                       (Priority_of_TM x24 x25))) 
               (forall ((x26 TM_PRIORITIES)) 
                   (exists ((x27 TM_SET)) 
                       (Priority_of_TM x27 x26))))
         :named hyp9))
(assert (! (and 
               (forall ((x28 TM_SET) (x29 ABSTRACT_TM_SIZES) (x30 ABSTRACT_TM_SIZES)) 
                   (=> 
                       (and 
                           (Abstract_Size_of_TM x28 x29) 
                           (Abstract_Size_of_TM x28 x30)) 
                       (= x29 x30))) 
               (forall ((x31 TM_SET)) 
                   (exists ((x32 ABSTRACT_TM_SIZES)) 
                       (Abstract_Size_of_TM x31 x32))) 
               (forall ((x33 ABSTRACT_TM_SIZES)) 
                   (exists ((x34 TM_SET)) 
                       (Abstract_Size_of_TM x34 x33))))
         :named hyp10))
(assert (! (and 
               (forall ((x35 PACKET_START_ADDRESSES_IN_TM_POOL) (x36 TM_PRIORITIES) (x37 TM_PRIORITIES)) 
                   (=> 
                       (and 
                           (Slot_Priority_in_TM_Pool x35 x36) 
                           (Slot_Priority_in_TM_Pool x35 x37)) 
                       (= x36 x37))) 
               (forall ((x38 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                   (exists ((x39 TM_PRIORITIES)) 
                       (Slot_Priority_in_TM_Pool x38 x39))) 
               (forall ((x40 TM_PRIORITIES)) 
                   (exists ((x41 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                       (Slot_Priority_in_TM_Pool x41 x40))))
         :named hyp11))
(assert (! (and 
               (forall ((x42 PACKET_START_ADDRESSES_IN_TM_POOL) (x43 ABSTRACT_TM_SIZES) (x44 ABSTRACT_TM_SIZES)) 
                   (=> 
                       (and 
                           (Abstract_Slot_Size_in_TM_Pool x42 x43) 
                           (Abstract_Slot_Size_in_TM_Pool x42 x44)) 
                       (= x43 x44))) 
               (forall ((x45 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                   (exists ((x46 ABSTRACT_TM_SIZES)) 
                       (Abstract_Slot_Size_in_TM_Pool x45 x46))) 
               (forall ((x47 ABSTRACT_TM_SIZES)) 
                   (exists ((x48 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                       (Abstract_Slot_Size_in_TM_Pool x48 x47))))
         :named hyp12))
(assert (! (and 
               (forall ((x49 PACKET_START_ADDRESSES_IN_TM_POOL) (x50 PP1)) 
                   (=> 
                       (Slot_Pids_in_TM_Pool x49 x50) 
                       (or 
                           (forall ((x51 PIDS)) 
                               (= 
                                   (MS x51 x50) 
                                   (= x51 csw))) 
                           (forall ((x52 PIDS)) 
                               (= 
                                   (MS x52 x50) 
                                   (= x52 mixsc))) 
                           (forall ((x53 PIDS)) 
                               (= 
                                   (MS x53 x50) 
                                   (= x53 mixst))) 
                           (forall ((x54 PIDS)) 
                               (= 
                                   (MS x54 x50) 
                                   (= x54 sixsp))) 
                           (forall ((x55 PIDS)) 
                               (= 
                                   (MS x55 x50) 
                                   (= x55 sixsx))) 
                           (forall ((x56 PIDS)) 
                               (= 
                                   (MS x56 x50) 
                                   (or 
                                       (= x56 csw) 
                                       (= x56 mixsc) 
                                       (= x56 mixst) 
                                       (= x56 sixsp) 
                                       (= x56 sixsx))))))) 
               (forall ((x57 PACKET_START_ADDRESSES_IN_TM_POOL) (x58 PP1) (x59 PP1)) 
                   (=> 
                       (and 
                           (Slot_Pids_in_TM_Pool x57 x58) 
                           (Slot_Pids_in_TM_Pool x57 x59)) 
                       (forall ((x60 PIDS)) 
                           (= 
                               (MS x60 x58) 
                               (MS x60 x59))))) 
               (forall ((x61 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                   (exists ((x62 PP1)) 
                       (Slot_Pids_in_TM_Pool x61 x62))) 
               (forall ((x63 PP1)) 
                   (=> 
                       (or 
                           (forall ((x64 PIDS)) 
                               (= 
                                   (MS x64 x63) 
                                   (= x64 csw))) 
                           (forall ((x65 PIDS)) 
                               (= 
                                   (MS x65 x63) 
                                   (= x65 mixsc))) 
                           (forall ((x66 PIDS)) 
                               (= 
                                   (MS x66 x63) 
                                   (= x66 mixst))) 
                           (forall ((x67 PIDS)) 
                               (= 
                                   (MS x67 x63) 
                                   (= x67 sixsp))) 
                           (forall ((x68 PIDS)) 
                               (= 
                                   (MS x68 x63) 
                                   (= x68 sixsx))) 
                           (forall ((x69 PIDS)) 
                               (= 
                                   (MS x69 x63) 
                                   (or 
                                       (= x69 csw) 
                                       (= x69 mixsc) 
                                       (= x69 mixst) 
                                       (= x69 sixsp) 
                                       (= x69 sixsx))))) 
                       (exists ((x70 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                           (Slot_Pids_in_TM_Pool x70 x63)))))
         :named hyp13))
(assert (! (and 
               (forall ((x71 ENQUEUEABLE_ELEMENTS) (x72 QUEUES) (x73 QUEUES)) 
                   (=> 
                       (Enqueue x71 x72 x73) 
                       (not 
                           (= x73 Empty_Queue)))) 
               (forall ((x74 ENQUEUEABLE_ELEMENTS) (x75 QUEUES) (x76 QUEUES) (x77 QUEUES)) 
                   (=> 
                       (and 
                           (Enqueue x74 x75 x76) 
                           (Enqueue x74 x75 x77)) 
                       (= x76 x77))) 
               (forall ((x78 ENQUEUEABLE_ELEMENTS) (x79 QUEUES)) 
                   (exists ((x80 QUEUES)) 
                       (Enqueue x78 x79 x80))) 
               (forall ((x81 QUEUES)) 
                   (=> 
                       (not 
                           (= x81 Empty_Queue)) 
                       (exists ((x82 ENQUEUEABLE_ELEMENTS) (x83 QUEUES)) 
                           (Enqueue x82 x83 x81)))) 
               (forall ((x84 QUEUES) (x85 ENQUEUEABLE_ELEMENTS) (x86 QUEUES) (x87 ENQUEUEABLE_ELEMENTS) (x88 QUEUES)) 
                   (=> 
                       (and 
                           (Enqueue x85 x86 x84) 
                           (Enqueue x87 x88 x84)) 
                       (and 
                           (= x85 x87) 
                           (= x86 x88)))))
         :named hyp14))
(assert (! (and 
               (forall ((x89 QUEUES) (x90 Int)) 
                   (=> 
                       (Length_of_Queue x89 x90) 
                       (<= 0 x90))) 
               (forall ((x91 QUEUES) (x92 Int) (x93 Int)) 
                   (=> 
                       (and 
                           (Length_of_Queue x91 x92) 
                           (Length_of_Queue x91 x93)) 
                       (= x92 x93))) 
               (forall ((x94 QUEUES)) 
                   (exists ((x95 Int)) 
                       (Length_of_Queue x94 x95))) 
               (forall ((x96 Int)) 
                   (=> 
                       (<= 0 x96) 
                       (exists ((x97 QUEUES)) 
                           (Length_of_Queue x97 x96)))))
         :named hyp15))
(assert (! (exists ((x98 Int)) 
               (and 
                   (= x98 0) 
                   (Length_of_Queue Empty_Queue x98)))
         :named hyp16))
(assert (! (exists ((x99 Int)) 
               (Length_of_Queue Empty_Queue x99))
         :named hyp17))
(assert (! (forall ((x100 QUEUES) (x101 Int) (x102 Int)) 
               (=> 
                   (and 
                       (Length_of_Queue x100 x101) 
                       (Length_of_Queue x100 x102)) 
                   (= x101 x102)))
         :named hyp18))
(assert (! (and 
               (forall ((x103 Int) (x104 PQ)) 
                   (=> 
                       (Queues_of_Length x103 x104) 
                       (<= 0 x103))) 
               (forall ((x105 Int) (x106 PQ) (x107 PQ)) 
                   (=> 
                       (and 
                           (Queues_of_Length x105 x106) 
                           (Queues_of_Length x105 x107)) 
                       (forall ((x108 QUEUES)) 
                           (= 
                               (MS0 x108 x106) 
                               (MS0 x108 x107))))) 
               (forall ((x109 Int)) 
                   (=> 
                       (<= 0 x109) 
                       (exists ((x110 PQ)) 
                           (Queues_of_Length x109 x110)))))
         :named hyp19))
(assert (! (and 
               (forall ((x111 QUEUES) (x112 PE) (x113 PE)) 
                   (=> 
                       (and 
                           (Elements_of_Queue x111 x112) 
                           (Elements_of_Queue x111 x113)) 
                       (forall ((x114 ENQUEUEABLE_ELEMENTS)) 
                           (= 
                               (MS1 x114 x112) 
                               (MS1 x114 x113))))) 
               (forall ((x115 QUEUES)) 
                   (exists ((x116 PE)) 
                       (Elements_of_Queue x115 x116))))
         :named hyp20))
(assert (! (exists ((x117 PE)) 
               (and 
                   (forall ((x118 ENQUEUEABLE_ELEMENTS)) 
                       (not 
                           (MS1 x118 x117))) 
                   (Elements_of_Queue Empty_Queue x117)))
         :named hyp21))
(assert (! (exists ((x119 PE)) 
               (Elements_of_Queue Empty_Queue x119))
         :named hyp22))
(assert (! (forall ((x120 QUEUES) (x121 PE) (x122 PE)) 
               (=> 
                   (and 
                       (Elements_of_Queue x120 x121) 
                       (Elements_of_Queue x120 x122)) 
                   (forall ((x123 ENQUEUEABLE_ELEMENTS)) 
                       (= 
                           (MS1 x123 x121) 
                           (MS1 x123 x122)))))
         :named hyp23))
(assert (! (and 
               (forall ((x124 QUEUES) (x125 PE) (x126 PE)) 
                   (=> 
                       (and 
                           (Duplicate_Elements_of_Queue x124 x125) 
                           (Duplicate_Elements_of_Queue x124 x126)) 
                       (forall ((x127 ENQUEUEABLE_ELEMENTS)) 
                           (= 
                               (MS1 x127 x125) 
                               (MS1 x127 x126))))) 
               (forall ((x128 QUEUES)) 
                   (exists ((x129 PE)) 
                       (Duplicate_Elements_of_Queue x128 x129))))
         :named hyp24))
(assert (! (exists ((x130 PE)) 
               (and 
                   (forall ((x131 ENQUEUEABLE_ELEMENTS)) 
                       (not 
                           (MS1 x131 x130))) 
                   (Duplicate_Elements_of_Queue Empty_Queue x130)))
         :named hyp25))
(assert (! (exists ((x132 PE)) 
               (Duplicate_Elements_of_Queue Empty_Queue x132))
         :named hyp26))
(assert (! (forall ((x133 QUEUES) (x134 PE) (x135 PE)) 
               (=> 
                   (and 
                       (Duplicate_Elements_of_Queue x133 x134) 
                       (Duplicate_Elements_of_Queue x133 x135)) 
                   (forall ((x136 ENQUEUEABLE_ELEMENTS)) 
                       (= 
                           (MS1 x136 x134) 
                           (MS1 x136 x135)))))
         :named hyp27))
(assert (! (and 
               (forall ((x137 QUEUES) (x138 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (Head_of_Queue x137 x138) 
                       (not 
                           (= x137 Empty_Queue)))) 
               (forall ((x139 QUEUES) (x140 ENQUEUEABLE_ELEMENTS) (x141 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (and 
                           (Head_of_Queue x139 x140) 
                           (Head_of_Queue x139 x141)) 
                       (= x140 x141))) 
               (forall ((x142 QUEUES)) 
                   (=> 
                       (not 
                           (= x142 Empty_Queue)) 
                       (exists ((x143 ENQUEUEABLE_ELEMENTS)) 
                           (Head_of_Queue x142 x143)))))
         :named hyp28))
(assert (! (and 
               (forall ((x144 QUEUES) (x145 QUEUES)) 
                   (=> 
                       (Dequeue x144 x145) 
                       (not 
                           (= x144 Empty_Queue)))) 
               (forall ((x146 QUEUES) (x147 QUEUES) (x148 QUEUES)) 
                   (=> 
                       (and 
                           (Dequeue x146 x147) 
                           (Dequeue x146 x148)) 
                       (= x147 x148))) 
               (forall ((x149 QUEUES)) 
                   (=> 
                       (not 
                           (= x149 Empty_Queue)) 
                       (exists ((x150 QUEUES)) 
                           (Dequeue x149 x150)))))
         :named hyp29))
(assert (! (forall ((x151 Int)) 
               (=> 
                   (MS2 x151 MAGIC_LENGTHS) 
                   (<= 0 x151)))
         :named hyp30))
(assert (! (exists ((x152 Int)) 
               (and 
                   (= x152 0) 
                   (MS2 x152 MAGIC_LENGTHS)))
         :named hyp31))
(assert (! (exists ((x153 ENQUEUEABLE_ELEMENTS)) 
               (MS1 x153 ENQUEUEABLE_TC_BUFFER_ELEMENTS))
         :named hyp32))
(assert (! (exists ((x154 ENQUEUEABLE_ELEMENTS)) 
               (MS1 x154 ENQUEUEABLE_TM_BUFFER_ELEMENTS))
         :named hyp33))
(assert (! (exists ((x155 ENQUEUEABLE_ELEMENTS)) 
               (MS1 x155 ENQUEUEABLE_TC_POOL_ELEMENTS))
         :named hyp34))
(assert (! (exists ((x156 ENQUEUEABLE_ELEMENTS)) 
               (MS1 x156 ENQUEUEABLE_TM_POOL_ELEMENTS))
         :named hyp35))
(assert (! (forall ((x157 ENQUEUEABLE_ELEMENTS)) 
               (not 
                   (and 
                       (MS1 x157 ENQUEUEABLE_TC_BUFFER_ELEMENTS) 
                       (MS1 x157 ENQUEUEABLE_TM_BUFFER_ELEMENTS))))
         :named hyp36))
(assert (! (forall ((x158 ENQUEUEABLE_ELEMENTS)) 
               (not 
                   (and 
                       (MS1 x158 ENQUEUEABLE_TC_BUFFER_ELEMENTS) 
                       (MS1 x158 ENQUEUEABLE_TC_POOL_ELEMENTS))))
         :named hyp37))
(assert (! (forall ((x159 ENQUEUEABLE_ELEMENTS)) 
               (not 
                   (and 
                       (MS1 x159 ENQUEUEABLE_TC_BUFFER_ELEMENTS) 
                       (MS1 x159 ENQUEUEABLE_TM_POOL_ELEMENTS))))
         :named hyp38))
(assert (! (forall ((x160 ENQUEUEABLE_ELEMENTS)) 
               (not 
                   (and 
                       (MS1 x160 ENQUEUEABLE_TM_BUFFER_ELEMENTS) 
                       (MS1 x160 ENQUEUEABLE_TC_POOL_ELEMENTS))))
         :named hyp39))
(assert (! (forall ((x161 ENQUEUEABLE_ELEMENTS)) 
               (not 
                   (and 
                       (MS1 x161 ENQUEUEABLE_TM_BUFFER_ELEMENTS) 
                       (MS1 x161 ENQUEUEABLE_TM_POOL_ELEMENTS))))
         :named hyp40))
(assert (! (forall ((x162 ENQUEUEABLE_ELEMENTS)) 
               (not 
                   (and 
                       (MS1 x162 ENQUEUEABLE_TC_POOL_ELEMENTS) 
                       (MS1 x162 ENQUEUEABLE_TM_POOL_ELEMENTS))))
         :named hyp41))
(assert (! (and 
               (forall ((x163 ENQUEUEABLE_ELEMENTS) (x164 PACKET_START_ADDRESSES_IN_TC_BUFFER)) 
                   (=> 
                       (TC_Buffer_Element_Address x163 x164) 
                       (MS1 x163 ENQUEUEABLE_TC_BUFFER_ELEMENTS))) 
               (forall ((x165 ENQUEUEABLE_ELEMENTS) (x166 PACKET_START_ADDRESSES_IN_TC_BUFFER) (x167 PACKET_START_ADDRESSES_IN_TC_BUFFER)) 
                   (=> 
                       (and 
                           (TC_Buffer_Element_Address x165 x166) 
                           (TC_Buffer_Element_Address x165 x167)) 
                       (= x166 x167))) 
               (forall ((x168 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (MS1 x168 ENQUEUEABLE_TC_BUFFER_ELEMENTS) 
                       (exists ((x169 PACKET_START_ADDRESSES_IN_TC_BUFFER)) 
                           (TC_Buffer_Element_Address x168 x169)))) 
               (forall ((x170 PACKET_START_ADDRESSES_IN_TC_BUFFER)) 
                   (exists ((x171 ENQUEUEABLE_ELEMENTS)) 
                       (TC_Buffer_Element_Address x171 x170))) 
               (forall ((x172 PACKET_START_ADDRESSES_IN_TC_BUFFER) (x173 ENQUEUEABLE_ELEMENTS) (x174 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (and 
                           (TC_Buffer_Element_Address x173 x172) 
                           (TC_Buffer_Element_Address x174 x172)) 
                       (= x173 x174))))
         :named hyp42))
(assert (! (and 
               (forall ((x175 ENQUEUEABLE_ELEMENTS) (x176 PACKET_START_ADDRESSES_IN_TM_BUFFER)) 
                   (=> 
                       (TM_Buffer_Element_Address x175 x176) 
                       (MS1 x175 ENQUEUEABLE_TM_BUFFER_ELEMENTS))) 
               (forall ((x177 ENQUEUEABLE_ELEMENTS) (x178 PACKET_START_ADDRESSES_IN_TM_BUFFER) (x179 PACKET_START_ADDRESSES_IN_TM_BUFFER)) 
                   (=> 
                       (and 
                           (TM_Buffer_Element_Address x177 x178) 
                           (TM_Buffer_Element_Address x177 x179)) 
                       (= x178 x179))) 
               (forall ((x180 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (MS1 x180 ENQUEUEABLE_TM_BUFFER_ELEMENTS) 
                       (exists ((x181 PACKET_START_ADDRESSES_IN_TM_BUFFER)) 
                           (TM_Buffer_Element_Address x180 x181)))) 
               (forall ((x182 PACKET_START_ADDRESSES_IN_TM_BUFFER)) 
                   (exists ((x183 ENQUEUEABLE_ELEMENTS)) 
                       (TM_Buffer_Element_Address x183 x182))) 
               (forall ((x184 PACKET_START_ADDRESSES_IN_TM_BUFFER) (x185 ENQUEUEABLE_ELEMENTS) (x186 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (and 
                           (TM_Buffer_Element_Address x185 x184) 
                           (TM_Buffer_Element_Address x186 x184)) 
                       (= x185 x186))))
         :named hyp43))
(assert (! (and 
               (forall ((x187 ENQUEUEABLE_ELEMENTS) (x188 PACKET_START_ADDRESSES_IN_TC_POOL)) 
                   (=> 
                       (TC_Pool_Element_Address x187 x188) 
                       (MS1 x187 ENQUEUEABLE_TC_POOL_ELEMENTS))) 
               (forall ((x189 ENQUEUEABLE_ELEMENTS) (x190 PACKET_START_ADDRESSES_IN_TC_POOL) (x191 PACKET_START_ADDRESSES_IN_TC_POOL)) 
                   (=> 
                       (and 
                           (TC_Pool_Element_Address x189 x190) 
                           (TC_Pool_Element_Address x189 x191)) 
                       (= x190 x191))) 
               (forall ((x192 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (MS1 x192 ENQUEUEABLE_TC_POOL_ELEMENTS) 
                       (exists ((x193 PACKET_START_ADDRESSES_IN_TC_POOL)) 
                           (TC_Pool_Element_Address x192 x193)))) 
               (forall ((x194 PACKET_START_ADDRESSES_IN_TC_POOL)) 
                   (exists ((x195 ENQUEUEABLE_ELEMENTS)) 
                       (TC_Pool_Element_Address x195 x194))) 
               (forall ((x196 PACKET_START_ADDRESSES_IN_TC_POOL) (x197 ENQUEUEABLE_ELEMENTS) (x198 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (and 
                           (TC_Pool_Element_Address x197 x196) 
                           (TC_Pool_Element_Address x198 x196)) 
                       (= x197 x198))))
         :named hyp44))
(assert (! (and 
               (forall ((x199 ENQUEUEABLE_ELEMENTS) (x200 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                   (=> 
                       (TM_Pool_Element_Address x199 x200) 
                       (MS1 x199 ENQUEUEABLE_TM_POOL_ELEMENTS))) 
               (forall ((x201 ENQUEUEABLE_ELEMENTS) (x202 PACKET_START_ADDRESSES_IN_TM_POOL) (x203 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                   (=> 
                       (and 
                           (TM_Pool_Element_Address x201 x202) 
                           (TM_Pool_Element_Address x201 x203)) 
                       (= x202 x203))) 
               (forall ((x204 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (MS1 x204 ENQUEUEABLE_TM_POOL_ELEMENTS) 
                       (exists ((x205 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                           (TM_Pool_Element_Address x204 x205)))) 
               (forall ((x206 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                   (exists ((x207 ENQUEUEABLE_ELEMENTS)) 
                       (TM_Pool_Element_Address x207 x206))) 
               (forall ((x208 PACKET_START_ADDRESSES_IN_TM_POOL) (x209 ENQUEUEABLE_ELEMENTS) (x210 ENQUEUEABLE_ELEMENTS)) 
                   (=> 
                       (and 
                           (TM_Pool_Element_Address x209 x208) 
                           (TM_Pool_Element_Address x210 x208)) 
                       (= x209 x210))))
         :named hyp45))
(assert (! (forall ((s PZ)) 
               (=> 
                   (and 
                       (forall ((x211 Int)) 
                           (=> 
                               (MS2 x211 s) 
                               (<= 0 x211))) 
                       (exists ((x212 Int)) 
                           (and 
                               (= x212 0) 
                               (MS2 x212 s))) 
                       (not 
                           (forall ((x213 Int)) 
                               (=> 
                                   (<= 0 x213) 
                                   (MS2 x213 s))))) 
                   (exists ((x214 Int)) 
                       (and 
                           (forall ((x215 Int)) 
                               (=> 
                                   (and 
                                       (<= 0 x215) 
                                       (not 
                                           (MS2 x215 s)) 
                                       (forall ((x216 Int)) 
                                           (=> 
                                               (and 
                                                   (<= 0 x216) 
                                                   (not 
                                                       (MS2 x216 s))) 
                                               (<= x215 x216)))) 
                                   (= x214 (- x215 1)))) 
                           (MS2 x214 s)))))
         :named hyp46))
(assert (! (forall ((s0 PZ)) 
               (=> 
                   (and 
                       (forall ((x217 Int)) 
                           (=> 
                               (MS2 x217 s0) 
                               (<= 0 x217))) 
                       (exists ((x218 Int)) 
                           (and 
                               (= x218 0) 
                               (MS2 x218 s0))) 
                       (forall ((n Int)) 
                           (=> 
                               (MS2 n s0) 
                               (exists ((x219 Int)) 
                                   (and 
                                       (= x219 (+ n 1)) 
                                       (MS2 x219 s0)))))) 
                   (forall ((x220 Int)) 
                       (=> 
                           (<= 0 x220) 
                           (MS2 x220 s0)))))
         :named hyp47))
(assert (! (exists ((x221 Int) (x222 PQ)) 
               (and 
                   (= x221 0) 
                   (forall ((x223 QUEUES)) 
                       (= 
                           (MS0 x223 x222) 
                           (= x223 Empty_Queue))) 
                   (Queues_of_Length x221 x222)))
         :named hyp48))
(assert (! (exists ((x224 PQ) (x225 Int)) 
               (and 
                   (= x225 0) 
                   (Queues_of_Length x225 x224)))
         :named hyp49))
(assert (! (forall ((x226 Int) (x227 PQ) (x228 PQ)) 
               (=> 
                   (and 
                       (Queues_of_Length x226 x227) 
                       (Queues_of_Length x226 x228)) 
                   (forall ((x229 QUEUES)) 
                       (= 
                           (MS0 x229 x227) 
                           (MS0 x229 x228)))))
         :named hyp50))
(assert (! (not 
               (forall ((x230 TC_SET)) 
                   (VALID_TCS x230)))
         :named hyp51))
(assert (! (not 
               (= TC_Unchecked TC_Accepted))
         :named hyp52))
(assert (! (not 
               (= TC_Unchecked TC_Rejected))
         :named hyp53))
(assert (! (not 
               (= TC_Unchecked TC_Waiting_for_Execution))
         :named hyp54))
(assert (! (not 
               (= TC_Unchecked TC_Successfully_Executed))
         :named hyp55))
(assert (! (not 
               (= TC_Unchecked TC_Execution_Failed))
         :named hyp56))
(assert (! (not 
               (= TC_Unchecked TC_Removable))
         :named hyp57))
(assert (! (not 
               (= TC_Accepted TC_Rejected))
         :named hyp58))
(assert (! (not 
               (= TC_Accepted TC_Waiting_for_Execution))
         :named hyp59))
(assert (! (not 
               (= TC_Accepted TC_Successfully_Executed))
         :named hyp60))
(assert (! (not 
               (= TC_Accepted TC_Execution_Failed))
         :named hyp61))
(assert (! (not 
               (= TC_Accepted TC_Removable))
         :named hyp62))
(assert (! (not 
               (= TC_Rejected TC_Waiting_for_Execution))
         :named hyp63))
(assert (! (not 
               (= TC_Rejected TC_Successfully_Executed))
         :named hyp64))
(assert (! (not 
               (= TC_Rejected TC_Execution_Failed))
         :named hyp65))
(assert (! (not 
               (= TC_Rejected TC_Removable))
         :named hyp66))
(assert (! (not 
               (= TC_Waiting_for_Execution TC_Successfully_Executed))
         :named hyp67))
(assert (! (not 
               (= TC_Waiting_for_Execution TC_Execution_Failed))
         :named hyp68))
(assert (! (not 
               (= TC_Waiting_for_Execution TC_Removable))
         :named hyp69))
(assert (! (not 
               (= TC_Successfully_Executed TC_Execution_Failed))
         :named hyp70))
(assert (! (not 
               (= TC_Successfully_Executed TC_Removable))
         :named hyp71))
(assert (! (not 
               (= TC_Execution_Failed TC_Removable))
         :named hyp72))
(assert (! (not 
               (= TM_Effective TM_Removable))
         :named hyp73))
(assert (! (not 
               (= csw mixsc))
         :named hyp74))
(assert (! (not 
               (= csw mixst))
         :named hyp75))
(assert (! (not 
               (= csw sixsp))
         :named hyp76))
(assert (! (not 
               (= csw sixsx))
         :named hyp77))
(assert (! (not 
               (= mixsc mixst))
         :named hyp78))
(assert (! (not 
               (= mixsc sixsp))
         :named hyp79))
(assert (! (not 
               (= mixsc sixsx))
         :named hyp80))
(assert (! (not 
               (= mixst sixsp))
         :named hyp81))
(assert (! (not 
               (= mixst sixsx))
         :named hyp82))
(assert (! (not 
               (= sixsp sixsx))
         :named hyp83))
(assert (! (not 
               (= High_Priority_TM Medium_Priority_TM))
         :named hyp84))
(assert (! (not 
               (= High_Priority_TM Low_Priority_TM))
         :named hyp85))
(assert (! (not 
               (= Medium_Priority_TM Low_Priority_TM))
         :named hyp86))
(assert (! (not 
               (= Short_TM Long_TM))
         :named hyp87))
(assert (! (forall ((k Int) (q0 QUEUES)) 
               (=> 
                   (and 
                       (<= 0 k) 
                       (exists ((x231 PQ)) 
                           (and 
                               (Queues_of_Length k x231) 
                               (MS0 q0 x231)))) 
                   (Length_of_Queue q0 k)))
         :named hyp88))
(assert (! (forall ((k0 Int)) 
               (=> 
                   (and 
                       (MS2 k0 MAGIC_LENGTHS) 
                       (not 
                           (= k0 0))) 
                   (forall ((q1 QUEUES)) 
                       (=> 
                           (exists ((x232 PQ)) 
                               (and 
                                   (Queues_of_Length k0 x232) 
                                   (MS0 q1 x232))) 
                           (and 
                               (exists ((x233 PE)) 
                                   (and 
                                       (forall ((x234 ENQUEUEABLE_ELEMENTS)) 
                                           (= 
                                               (MS1 x234 x233) 
                                               (or 
                                                   (Head_of_Queue q1 x234) 
                                                   (exists ((x235 PE)) 
                                                       (and 
                                                           (exists ((x236 QUEUES)) 
                                                               (and 
                                                                   (Dequeue q1 x236) 
                                                                   (Elements_of_Queue x236 x235))) 
                                                           (MS1 x234 x235)))))) 
                                       (Elements_of_Queue q1 x233))) 
                               (exists ((x237 PE)) 
                                   (and 
                                       (forall ((x238 ENQUEUEABLE_ELEMENTS)) 
                                           (= 
                                               (MS1 x238 x237) 
                                               (or 
                                                   (and 
                                                       (Head_of_Queue q1 x238) 
                                                       (exists ((x239 PE)) 
                                                           (and 
                                                               (exists ((x240 QUEUES)) 
                                                                   (and 
                                                                       (Dequeue q1 x240) 
                                                                       (Elements_of_Queue x240 x239))) 
                                                               (MS1 x238 x239)))) 
                                                   (exists ((x241 PE)) 
                                                       (and 
                                                           (exists ((x242 QUEUES)) 
                                                               (and 
                                                                   (Dequeue q1 x242) 
                                                                   (Duplicate_Elements_of_Queue x242 x241))) 
                                                           (MS1 x238 x241)))))) 
                                       (Duplicate_Elements_of_Queue q1 x237))))))))
         :named hyp89))
(assert (! (forall ((k1 Int)) 
               (=> 
                   (and 
                       (<= 0 k1) 
                       (not 
                           (= k1 0)) 
                       (forall ((q2 QUEUES)) 
                           (=> 
                               (exists ((x243 PQ)) 
                                   (and 
                                       (Queues_of_Length k1 x243) 
                                       (MS0 q2 x243))) 
                               (and 
                                   (exists ((x244 PE)) 
                                       (and 
                                           (forall ((x245 ENQUEUEABLE_ELEMENTS)) 
                                               (= 
                                                   (MS1 x245 x244) 
                                                   (or 
                                                       (Head_of_Queue q2 x245) 
                                                       (exists ((x246 PE)) 
                                                           (and 
                                                               (exists ((x247 QUEUES)) 
                                                                   (and 
                                                                       (Dequeue q2 x247) 
                                                                       (Elements_of_Queue x247 x246))) 
                                                               (MS1 x245 x246)))))) 
                                           (Elements_of_Queue q2 x244))) 
                                   (exists ((x248 PE)) 
                                       (and 
                                           (forall ((x249 ENQUEUEABLE_ELEMENTS)) 
                                               (= 
                                                   (MS1 x249 x248) 
                                                   (or 
                                                       (and 
                                                           (Head_of_Queue q2 x249) 
                                                           (exists ((x250 PE)) 
                                                               (and 
                                                                   (exists ((x251 QUEUES)) 
                                                                       (and 
                                                                           (Dequeue q2 x251) 
                                                                           (Elements_of_Queue x251 x250))) 
                                                                   (MS1 x249 x250)))) 
                                                       (exists ((x252 PE)) 
                                                           (and 
                                                               (exists ((x253 QUEUES)) 
                                                                   (and 
                                                                       (Dequeue q2 x253) 
                                                                       (Duplicate_Elements_of_Queue x253 x252))) 
                                                               (MS1 x249 x252)))))) 
                                           (Duplicate_Elements_of_Queue q2 x248))))))) 
                   (MS2 k1 MAGIC_LENGTHS)))
         :named hyp90))
(assert (! (forall ((k2 Int)) 
               (=> 
                   (and 
                       (<= 0 k2) 
                       (not 
                           (= k2 0))) 
                   (<= 0 (- k2 1))))
         :named hyp91))
(assert (! (forall ((t PZ)) 
               (=> 
                   (and 
                       (forall ((x254 Int)) 
                           (=> 
                               (MS2 x254 t) 
                               (<= 0 x254))) 
                       (not 
                           (forall ((x255 Int)) 
                               (not 
                                   (MS2 x255 t))))) 
                   (exists ((x256 Int)) 
                       (and 
                           (MS2 x256 t) 
                           (forall ((x257 Int)) 
                               (=> 
                                   (MS2 x257 t) 
                                   (<= x256 x257)))))))
         :named hyp92))
(assert (! (forall ((t0 PZ)) 
               (=> 
                   (and 
                       (forall ((x258 Int)) 
                           (=> 
                               (MS2 x258 t0) 
                               (<= 0 x258))) 
                       (not 
                           (forall ((x259 Int)) 
                               (not 
                                   (MS2 x259 t0))))) 
                   (forall ((x260 Int)) 
                       (=> 
                           (MS2 x260 t0) 
                           (exists ((x261 Int)) 
                               (and 
                                   (MS2 x261 t0) 
                                   (<= x261 x260)))))))
         :named hyp93))
(assert (! (forall ((k3 Int) (m Int)) 
               (=> 
                   (and 
                       (<= 0 k3) 
                       (<= 0 m) 
                       (not 
                           (= k3 m))) 
                   (forall ((x262 QUEUES)) 
                       (not 
                           (and 
                               (exists ((x263 PQ)) 
                                   (and 
                                       (Queues_of_Length k3 x263) 
                                       (MS0 x262 x263))) 
                               (exists ((x264 PQ)) 
                                   (and 
                                       (Queues_of_Length m x264) 
                                       (MS0 x262 x264))))))))
         :named hyp94))
(assert (! (forall ((k4 Int)) 
               (=> 
                   (and 
                       (<= 0 k4) 
                       (not 
                           (= k4 0))) 
                   (not 
                       (exists ((x265 PQ)) 
                           (and 
                               (Queues_of_Length k4 x265) 
                               (MS0 Empty_Queue x265))))))
         :named hyp95))
(assert (! (forall ((a PACKET_START_ADDRESSES_IN_TM_POOL)) 
               (=> 
                   (Abstract_Slot_Size_in_TM_Pool a Long_TM) 
                   (Slot_Priority_in_TM_Pool a Low_Priority_TM)))
         :named hyp96))
(assert (! (forall ((a0 ENQUEUEABLE_ELEMENTS)) 
               (exists ((x266 QUEUES)) 
                   (and 
                       (Enqueue a0 Empty_Queue x266) 
                       (Head_of_Queue x266 a0))))
         :named hyp97))
(assert (! (forall ((a1 ENQUEUEABLE_ELEMENTS)) 
               (exists ((x267 QUEUES)) 
                   (and 
                       (Enqueue a1 Empty_Queue x267) 
                       (Dequeue x267 Empty_Queue))))
         :named hyp98))
(assert (! (forall ((a2 PACKET_START_ADDRESSES_IN_TM_POOL)) 
               (=> 
                   (Slot_Priority_in_TM_Pool a2 Medium_Priority_TM) 
                   (not 
                       (exists ((x268 PP1)) 
                           (and 
                               (forall ((x269 PIDS)) 
                                   (= 
                                       (MS x269 x268) 
                                       (= x269 csw))) 
                               (Slot_Pids_in_TM_Pool a2 x268))))))
         :named hyp99))
(assert (! (forall ((pri TM_PRIORITIES) (size ABSTRACT_TM_SIZES) (pid PIDS)) 
               (=> 
                   (and 
                       (or 
                           (not 
                               (= size Long_TM)) 
                           (= pri Low_Priority_TM)) 
                       (or 
                           (not 
                               (= pri Medium_Priority_TM)) 
                           (not 
                               (= pid csw)))) 
                   (exists ((a3 PACKET_START_ADDRESSES_IN_TM_POOL)) 
                       (and 
                           (Slot_Priority_in_TM_Pool a3 pri) 
                           (Abstract_Slot_Size_in_TM_Pool a3 size) 
                           (exists ((x270 PP1)) 
                               (and 
                                   (forall ((x271 PIDS)) 
                                       (= 
                                           (MS x271 x270) 
                                           (= x271 pid))) 
                                   (Slot_Pids_in_TM_Pool a3 x270)))))))
         :named hyp100))
(assert (! (forall ((a4 ENQUEUEABLE_ELEMENTS) (q3 QUEUES)) 
               (exists ((x272 QUEUES) (x273 Int)) 
                   (and 
                       (Enqueue a4 q3 x272) 
                       (forall ((x274 Int)) 
                           (=> 
                               (Length_of_Queue q3 x274) 
                               (= x273 (+ x274 1)))) 
                       (Length_of_Queue x272 x273))))
         :named hyp101))
(assert (! (forall ((k5 Int) (q4 QUEUES)) 
               (=> 
                   (and 
                       (<= 0 k5) 
                       (Length_of_Queue q4 k5)) 
                   (exists ((x275 PQ)) 
                       (and 
                           (Queues_of_Length k5 x275) 
                           (MS0 q4 x275)))))
         :named hyp102))
(assert (! (forall ((a5 ENQUEUEABLE_ELEMENTS) (q5 QUEUES)) 
               (exists ((x276 QUEUES) (x277 PE)) 
                   (and 
                       (Enqueue a5 q5 x276) 
                       (forall ((x278 ENQUEUEABLE_ELEMENTS)) 
                           (= 
                               (MS1 x278 x277) 
                               (or 
                                   (= x278 a5) 
                                   (exists ((x279 PE)) 
                                       (and 
                                           (Elements_of_Queue q5 x279) 
                                           (MS1 x278 x279)))))) 
                       (Elements_of_Queue x276 x277))))
         :named hyp103))
(assert (! (forall ((a6 ENQUEUEABLE_ELEMENTS) (q6 QUEUES)) 
               (exists ((x280 QUEUES) (x281 PE)) 
                   (and 
                       (Enqueue a6 q6 x280) 
                       (forall ((x282 ENQUEUEABLE_ELEMENTS)) 
                           (= 
                               (MS1 x282 x281) 
                               (or 
                                   (and 
                                       (= x282 a6) 
                                       (exists ((x283 PE)) 
                                           (and 
                                               (Elements_of_Queue q6 x283) 
                                               (MS1 x282 x283)))) 
                                   (exists ((x284 PE)) 
                                       (and 
                                           (Duplicate_Elements_of_Queue q6 x284) 
                                           (MS1 x282 x284)))))) 
                       (Duplicate_Elements_of_Queue x280 x281))))
         :named hyp104))
(assert (! (forall ((a7 ENQUEUEABLE_ELEMENTS) (q7 QUEUES)) 
               (=> 
                   (not 
                       (= q7 Empty_Queue)) 
                   (exists ((x285 QUEUES) (x286 ENQUEUEABLE_ELEMENTS)) 
                       (and 
                           (Enqueue a7 q7 x285) 
                           (Head_of_Queue q7 x286) 
                           (Head_of_Queue x285 x286)))))
         :named hyp105))
(assert (! (forall ((a8 ENQUEUEABLE_ELEMENTS) (q8 QUEUES)) 
               (=> 
                   (not 
                       (= q8 Empty_Queue)) 
                   (exists ((x287 QUEUES) (x288 QUEUES)) 
                       (and 
                           (Enqueue a8 q8 x287) 
                           (exists ((x289 QUEUES)) 
                               (and 
                                   (Dequeue q8 x289) 
                                   (Enqueue a8 x289 x288))) 
                           (Dequeue x287 x288)))))
         :named hyp106))
(assert (! (forall ((k6 Int) (r QUEUES)) 
               (=> 
                   (and 
                       (<= 0 k6) 
                       (exists ((x290 PQ)) 
                           (and 
                               (exists ((x291 Int)) 
                                   (and 
                                       (= x291 (+ k6 1)) 
                                       (Queues_of_Length x291 x290))) 
                               (MS0 r x290)))) 
                   (exists ((a9 ENQUEUEABLE_ELEMENTS) (q9 QUEUES)) 
                       (and 
                           (exists ((x292 PQ)) 
                               (and 
                                   (Queues_of_Length k6 x292) 
                                   (MS0 q9 x292))) 
                           (Enqueue a9 q9 r)))))
         :named hyp107))
(assert (! (forall ((k7 Int) (a10 ENQUEUEABLE_ELEMENTS) (q10 QUEUES)) 
               (=> 
                   (and 
                       (<= 0 k7) 
                       (exists ((x293 PQ)) 
                           (and 
                               (Queues_of_Length k7 x293) 
                               (MS0 q10 x293)))) 
                   (exists ((x294 PQ)) 
                       (and 
                           (exists ((x295 Int)) 
                               (and 
                                   (= x295 (+ k7 1)) 
                                   (Queues_of_Length x295 x294))) 
                           (exists ((x296 QUEUES)) 
                               (and 
                                   (Enqueue a10 q10 x296) 
                                   (MS0 x296 x294)))))))
         :named hyp108))
(assert (! (forall ((a11 ENQUEUEABLE_ELEMENTS) (q11 QUEUES)) 
               (=> 
                   (Enqueue a11 Empty_Queue q11) 
                   (exists ((x297 PE)) 
                       (and 
                           (forall ((x298 ENQUEUEABLE_ELEMENTS)) 
                               (= 
                                   (MS1 x298 x297) 
                                   (or 
                                       (Head_of_Queue q11 x298) 
                                       (exists ((x299 PE)) 
                                           (and 
                                               (exists ((x300 QUEUES)) 
                                                   (and 
                                                       (Dequeue q11 x300) 
                                                       (Elements_of_Queue x300 x299))) 
                                               (MS1 x298 x299)))))) 
                           (Elements_of_Queue q11 x297)))))
         :named hyp109))
(assert (! (forall ((a12 ENQUEUEABLE_ELEMENTS) (q12 QUEUES)) 
               (=> 
                   (Enqueue a12 Empty_Queue q12) 
                   (exists ((x301 PE)) 
                       (and 
                           (forall ((x302 ENQUEUEABLE_ELEMENTS)) 
                               (= 
                                   (MS1 x302 x301) 
                                   (or 
                                       (and 
                                           (Head_of_Queue q12 x302) 
                                           (exists ((x303 PE)) 
                                               (and 
                                                   (exists ((x304 QUEUES)) 
                                                       (and 
                                                           (Dequeue q12 x304) 
                                                           (Elements_of_Queue x304 x303))) 
                                                   (MS1 x302 x303)))) 
                                       (exists ((x305 PE)) 
                                           (and 
                                               (exists ((x306 QUEUES)) 
                                                   (and 
                                                       (Dequeue q12 x306) 
                                                       (Duplicate_Elements_of_Queue x306 x305))) 
                                               (MS1 x302 x305)))))) 
                           (Duplicate_Elements_of_Queue q12 x301)))))
         :named hyp110))
(assert (! (forall ((a13 ENQUEUEABLE_ELEMENTS) (q13 QUEUES)) 
               (=> 
                   (and 
                       (not 
                           (= q13 Empty_Queue)) 
                       (exists ((x307 PE)) 
                           (and 
                               (forall ((x308 ENQUEUEABLE_ELEMENTS)) 
                                   (= 
                                       (MS1 x308 x307) 
                                       (or 
                                           (Head_of_Queue q13 x308) 
                                           (exists ((x309 PE)) 
                                               (and 
                                                   (exists ((x310 QUEUES)) 
                                                       (and 
                                                           (Dequeue q13 x310) 
                                                           (Elements_of_Queue x310 x309))) 
                                                   (MS1 x308 x309)))))) 
                               (Elements_of_Queue q13 x307)))) 
                   (exists ((x311 QUEUES) (x312 PE)) 
                       (and 
                           (Enqueue a13 q13 x311) 
                           (forall ((x313 ENQUEUEABLE_ELEMENTS)) 
                               (= 
                                   (MS1 x313 x312) 
                                   (or 
                                       (exists ((x314 QUEUES)) 
                                           (and 
                                               (Enqueue a13 q13 x314) 
                                               (Head_of_Queue x314 x313))) 
                                       (exists ((x315 PE)) 
                                           (and 
                                               (exists ((x316 QUEUES)) 
                                                   (and 
                                                       (exists ((x317 QUEUES)) 
                                                           (and 
                                                               (Enqueue a13 q13 x317) 
                                                               (Dequeue x317 x316))) 
                                                       (Elements_of_Queue x316 x315))) 
                                               (MS1 x313 x315)))))) 
                           (Elements_of_Queue x311 x312)))))
         :named hyp111))
(assert (! (not 
               (= q Empty_Queue))
         :named hyp112))
(assert (! (not 
               (exists ((x318 QUEUES)) 
                   (Dequeue q x318)))
         :named goal))
(check-sat)
(exit)

