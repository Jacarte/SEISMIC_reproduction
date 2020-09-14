(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32) (result i32)))
  (type (;8;) (func (param i32 i64)))
  (type (;9;) (func (param i32) (result i64)))
  (type (;10;) (func (param i64 i32) (result i64)))
  (import "env" "exit" (func $exit (type 1)))
  (import "env" "emscripten_memcpy_big" (func $emscripten_memcpy_big (type 6)))
  (import "env" "emscripten_resize_heap" (func $emscripten_resize_heap (type 3)))
  (import "env" "emscripten_asm_const_iii" (func $emscripten_asm_const_iii (type 6)))
  (import "env" "memory" (memory (;0;) 4096 4096))
  (func $__wasm_call_ctors (type 0)
    (nop))
  (func $memcpy (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    (if  
      (i32.ge_u
        (local.get 2)
        (i32.const 512))
      (then
        (drop
          (call $emscripten_memcpy_big
            (local.get 0)
            (local.get 1)
            (local.get 2)))
        (return
          (local.get 0))))
    (local.set 3
      (i32.add(local.get 0)
        (local.get 2)))
    (block  
      (if  
        (i32.eqz
          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(local.get 0)(local.get 1))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 0))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 3))(i32.const 1)
)))(i32.const 1)
))
        (then
          (block  
            (if  
              (i32.lt_s
                (local.get 2)
                (i32.const 1))
              (then
                (local.set 2
                  (local.get 0))
                (br 1 (;@4;))))
            (if  
              (i32.eqz
                (i32.and(local.get 0)
                  (i32.const 3)))
              (then
                (local.set 2
                  (local.get 0))
                (br 1 (;@5;))))
            (local.set 2
              (local.get 0))
            (loop  
              (i32.store8
                (local.get 2)
                (i32.load8_u
                  (local.get 1)))
              (local.set 1
                (i32.add(local.get 1)
                  (i32.const 1)))
              (br_if 1 (;@6;)
                (i32.ge_u
                  (local.tee 2
                    (i32.add(local.get 2)
                      (i32.const 1)))
                  (local.get 3)))
              (br_if 0 (;@7;)
                (i32.and(local.get 2)
                  (i32.const 3)))))
          (block  
            (br_if 0 (;@8;)
              (i32.lt_u
                (local.tee 4
                  (i32.and(local.get 3)
                    (i32.const -4)))
                (i32.const 64)))
            (br_if 0 (;@8;)
              (i32.gt_u
                (local.get 2)
                (local.tee 5
                  (i32.add(local.get 4)
                    (i32.const -64)))))
            (loop  
              (i32.store
                (local.get 2)
                (i32.load
                  (local.get 1)))
              (i32.store offset=4
                (local.get 2)
                (i32.load offset=4
                  (local.get 1)))
              (i32.store offset=8
                (local.get 2)
                (i32.load offset=8
                  (local.get 1)))
              (i32.store offset=12
                (local.get 2)
                (i32.load offset=12
                  (local.get 1)))
              (i32.store offset=16
                (local.get 2)
                (i32.load offset=16
                  (local.get 1)))
              (i32.store offset=20
                (local.get 2)
                (i32.load offset=20
                  (local.get 1)))
              (i32.store offset=24
                (local.get 2)
                (i32.load offset=24
                  (local.get 1)))
              (i32.store offset=28
                (local.get 2)
                (i32.load offset=28
                  (local.get 1)))
              (i32.store offset=32
                (local.get 2)
                (i32.load offset=32
                  (local.get 1)))
              (i32.store offset=36
                (local.get 2)
                (i32.load offset=36
                  (local.get 1)))
              (i32.store offset=40
                (local.get 2)
                (i32.load offset=40
                  (local.get 1)))
              (i32.store offset=44
                (local.get 2)
                (i32.load offset=44
                  (local.get 1)))
              (i32.store offset=48
                (local.get 2)
                (i32.load offset=48
                  (local.get 1)))
              (i32.store offset=52
                (local.get 2)
                (i32.load offset=52
                  (local.get 1)))
              (i32.store offset=56
                (local.get 2)
                (i32.load offset=56
                  (local.get 1)))
              (i32.store offset=60
                (local.get 2)
                (i32.load offset=60
                  (local.get 1)))
              (local.set 1
                (i32.sub
                  (local.get 1)
                  (i32.const -64)))
              (br_if 0 (;@9;)
                (i32.le_u
                  (local.tee 2
                    (i32.sub
                      (local.get 2)
                      (i32.const -64)))
                  (local.get 5)))))
          (br_if 1 (;@8;)
            (i32.ge_u
              (local.get 2)
              (local.get 4)))
          (loop  
            (i32.store
              (local.get 2)
              (i32.load
                (local.get 1)))
            (local.set 1
              (i32.add(local.get 1)
                (i32.const 4)))
            (br_if 0 (;@10;)
              (i32.lt_u
                (local.tee 2
                  (i32.add(local.get 2)
                    (i32.const 4)))
                (local.get 4))))
          (br 1 (;@9;))))
      (if  
        (i32.lt_u
          (local.get 3)
          (i32.const 4))
        (then
          (local.set 2
            (local.get 0))
          (br 1 (;@10;))))
      (if  
        (i32.lt_u
          (local.tee 4
            (i32.add(local.get 3)
              (i32.const -4)))
          (local.get 0))
        (then
          (local.set 2
            (local.get 0))
          (br 1 (;@11;))))
      (local.set 2
        (local.get 0))
      (loop  
        (i32.store8
          (local.get 2)
          (i32.load8_u
            (local.get 1)))
        (i32.store8 offset=1
          (local.get 2)
          (i32.load8_u offset=1
            (local.get 1)))
        (i32.store8 offset=2
          (local.get 2)
          (i32.load8_u offset=2
            (local.get 1)))
        (i32.store8 offset=3
          (local.get 2)
          (i32.load8_u offset=3
            (local.get 1)))
        (local.set 1
          (i32.add(local.get 1)
            (i32.const 4)))
        (br_if 0 (;@13;)
          (i32.le_u
            (local.tee 2
              (i32.add(local.get 2)
                (i32.const 4)))
            (local.get 4)))))
    (if  
      (i32.lt_u
        (local.get 2)
        (local.get 3))
      (then
        (loop  
          (i32.store8
            (local.get 2)
            (i32.load8_u
              (local.get 1)))
          (local.set 1
            (i32.add(local.get 1)
              (i32.const 1)))
          (br_if 0 (;@15;)
            (i32.ne
              (local.tee 2
                (i32.add(local.get 2)
                  (i32.const 1)))
              (local.get 3))))))
    (local.get 0))
  (func $memset (type 2) (param i32 i32)
    (local i32)
    (block  
      (br_if 0 (;@1;)
        (i32.eqz
          (local.get 1)))
      (i32.store8
        (i32.add(local.tee 2
            (i32.add(local.get 0)
              (local.get 1)))
          (i32.const -1))
        (i32.const 0))
      (i32.store8
        (local.get 0)
        (i32.const 0))
      (br_if 0 (;@1;)
        (i32.lt_u
          (local.get 1)
          (i32.const 3)))
      (i32.store8
        (i32.add(local.get 2)
          (i32.const -2))
        (i32.const 0))
      (i32.store8 offset=1
        (local.get 0)
        (i32.const 0))
      (i32.store8
        (i32.add(local.get 2)
          (i32.const -3))
        (i32.const 0))
      (i32.store8 offset=2
        (local.get 0)
        (i32.const 0))
      (br_if 0 (;@1;)
        (i32.lt_u
          (local.get 1)
          (i32.const 7)))
      (i32.store8
        (i32.add(local.get 2)
          (i32.const -4))
        (i32.const 0))
      (i32.store8 offset=3
        (local.get 0)
        (i32.const 0))
      (br_if 0 (;@1;)
        (i32.lt_u
          (local.get 1)
          (i32.const 9)))
      (i32.store
        (local.tee 0
          (i32.add(local.get 0)
            (local.tee 2
              (i32.and(i32.sub
                  (i32.const 0)
                  (local.get 0))
                (i32.const 3)))))
        (i32.const 0))
      (i32.store
        (i32.add(local.tee 1
            (i32.add(local.get 0)
              (local.tee 2
                (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.sub
                    (local.get 1)
                    (local.get 2)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -4))(i32.const 1)
)))(i32.const 1)
))))
          (i32.const -4))
        (i32.const 0))
      (br_if 0 (;@1;)
        (i32.lt_u
          (local.get 2)
          (i32.const 9)))
      (i32.store offset=8
        (local.get 0)
        (i32.const 0))
      (i32.store offset=4
        (local.get 0)
        (i32.const 0))
      (i32.store
        (i32.add(local.get 1)
          (i32.const -8))
        (i32.const 0))
      (i32.store
        (i32.add(local.get 1)
          (i32.const -12))
        (i32.const 0))
      (br_if 0 (;@1;)
        (i32.lt_u
          (local.get 2)
          (i32.const 25)))
      (i32.store offset=24
        (local.get 0)
        (i32.const 0))
      (i32.store offset=20
        (local.get 0)
        (i32.const 0))
      (i32.store offset=16
        (local.get 0)
        (i32.const 0))
      (i32.store offset=12
        (local.get 0)
        (i32.const 0))
      (i32.store
        (i32.add(local.get 1)
          (i32.const -16))
        (i32.const 0))
      (i32.store
        (i32.add(local.get 1)
          (i32.const -20))
        (i32.const 0))
      (i32.store
        (i32.add(local.get 1)
          (i32.const -24))
        (i32.const 0))
      (i32.store
        (i32.add(local.get 1)
          (i32.const -28))
        (i32.const 0))
      (br_if 0 (;@1;)
        (i32.lt_u
          (local.tee 1
            (i32.sub
              (local.get 2)
              (local.tee 2
                (i32.or
                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 0))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
)
                  (i32.const 24)))))
          (i32.const 32)))
      (local.set 0
        (i32.add(local.get 0)
          (local.get 2)))
      (loop  
        (i64.store offset=24
          (local.get 0)
          (i64.const 0))
        (i64.store offset=16
          (local.get 0)
          (i64.const 0))
        (i64.store offset=8
          (local.get 0)
          (i64.const 0))
        (i64.store
          (local.get 0)
          (i64.const 0))
        (local.set 0
          (i32.add(local.get 0)
            (i32.const 32)))
        (br_if 0 (;@2;)
          (i32.gt_u
            (local.tee 1
              (i32.add(local.get 1)
                (i32.const -32)))
            (i32.const 31))))))
  (func $__errno_location (type 5) (result i32)
    (i32.const 1648))
  (func $sbrk (type 3) (param i32) (result i32)
    (local i32 i32)
    (local.set 0
      (i32.add(local.tee 1
          (i32.load
            (i32.const 205557344)))
        (local.tee 2
          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.add(local.get 0)
              (i32.const 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -4))(i32.const 1)
)))(i32.const 1)
))))
    (block  
      (br_if 0 (;@1;)
        (select
          (i32.ge_s
            (local.get 2)
            (i32.const 1))
          (i32.const 0)
          (i32.le_u
            (local.get 0)
            (local.get 1))))
      (if  
        (i32.gt_u
          (local.get 0)
          (i32.shl(memory.size)
            (i32.const 16)))
        (then
          (br_if 1 (;@1;)
            (i32.eqz
              (call $emscripten_resize_heap
                (local.get 0))))))
      (i32.store
        (i32.const 205557344)
        (local.get 0))
      (return
        (local.get 1)))
    (i32.store
      (i32.const 1648)
      (i32.const 48))
    (i32.const -1))
  (func $dlmalloc (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (global.set 0
      (local.tee 11
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (block  
      (block  
        (block  
          (block  
            (block  
              (block  
                (block  
                  (block  
                    (block  
                      (block  
                        (block  
                          (if  
                            (i32.le_u
                              (local.get 0)
                              (i32.const 244))
                            (then
                              (if  
                                (i32.and(local.tee 1
                                    (i32.shr_u
                                      (local.tee 6
                                        (i32.load
                                          (i32.const 1652)))
                                      (local.tee 0
                                        (i32.shr_u
                                          (local.tee 5
                                            (select
                                              (i32.const 16)
                                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.add(local.get 0)
                                                  (i32.const 11)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
)
                                              (i32.lt_u
                                                (local.get 0)
                                                (i32.const 11))))
                                          (i32.const 3)))))
                                  (i32.const 3))
                                (then
                                  (local.set 0
                                    (i32.add(local.tee 1
                                        (i32.load
                                          (i32.add(local.tee 4
                                              (i32.shl(local.tee 2
                                                  (i32.add(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(local.get 1)(i32.const -1))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -1))(i32.const 1)
))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
)
                                                    (local.get 0)))
                                                (i32.const 3)))
                                            (i32.const 1700))))
                                      (i32.const 8)))
                                  (block  
                                    (if  
                                      (i32.eq
                                        (local.tee 3
                                          (i32.load offset=8
                                            (local.get 1)))
                                        (local.tee 4
                                          (i32.add(local.get 4)
                                            (i32.const 1692))))
                                      (then
                                        (i32.store
                                          (i32.const 1652)
                                          (i32.and(local.get 6)
                                            (i32.rotl
                                              (i32.const -2)
                                              (local.get 2))))
                                        (br 1 (;@14;))))
                                    (drop
                                      (i32.load
                                        (i32.const 1668)))
                                    (i32.store offset=12
                                      (local.get 3)
                                      (local.get 4))
                                    (i32.store offset=8
                                      (local.get 4)
                                      (local.get 3)))
                                  (i32.store offset=4
                                    (local.get 1)
                                    (i32.or
                                      (local.tee 2
                                        (i32.shl(local.get 2)
                                          (i32.const 3)))
                                      (i32.const 3)))
                                  (i32.store offset=4
                                    (local.tee 1
                                      (i32.add(local.get 1)
                                        (local.get 2)))
                                    (i32.or
                                      (i32.load offset=4
                                        (local.get 1))
                                      (i32.const 1)))
                                  (br 12 (;@3;))))
                              (br_if 1 (;@14;)
                                (i32.le_u
                                  (local.get 5)
                                  (local.tee 8
                                    (i32.load
                                      (i32.const 1660)))))
                              (if  
                                (local.get 1)
                                (then
                                  (block  
                                    (if  
                                      (i32.eq
                                        (local.tee 0
                                          (i32.load offset=8
                                            (local.tee 1
                                              (i32.load
                                                (i32.add(local.tee 3
                                                    (i32.shl(local.tee 2
                                                        (i32.add(i32.or
                                                            (i32.or
                                                              (i32.or
                                                                (i32.or
                                                                  (local.tee 2
                                                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                                        (local.tee 1
                                                                          (i32.shr_u
                                                                            (local.tee 0
                                                                              (i32.add(i32.and(local.tee 0
                                                                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                                                                                        (local.tee 2
                                                                                          (i32.shl(i32.const 2)
                                                                                            (local.get 0)))
                                                                                        (i32.sub
                                                                                          (i32.const 0)
                                                                                          (local.get 2))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shl(local.get 1)
                                                                                        (local.get 0)))(i32.const 1)
)))(i32.const 1)
))
                                                                                  (i32.sub
                                                                                    (i32.const 0)
                                                                                    (local.get 0)))
                                                                                (i32.const -1)))
                                                                            (local.tee 0
                                                                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                                                  (local.get 0)
                                                                                  (i32.const 12)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 16))(i32.const 1)
)))(i32.const 1)
))))
                                                                        (i32.const 5)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 8))(i32.const 1)
)))(i32.const 1)
))
                                                                  (local.get 0))
                                                                (local.tee 1
                                                                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                                      (local.tee 0
                                                                        (i32.shr_u
                                                                          (local.get 1)
                                                                          (local.get 2)))
                                                                      (i32.const 2)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
)))
                                                              (local.tee 1
                                                                (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                                    (local.tee 0
                                                                      (i32.shr_u
                                                                        (local.get 0)
                                                                        (local.get 1)))
                                                                    (i32.const 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 2))(i32.const 1)
)))(i32.const 1)
)))
                                                            (local.tee 1
                                                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                                  (local.tee 0
                                                                    (i32.shr_u
                                                                      (local.get 0)
                                                                      (local.get 1)))
                                                                  (i32.const 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
)))
                                                          (i32.shr_u
                                                            (local.get 0)
                                                            (local.get 1))))
                                                      (i32.const 3)))
                                                  (i32.const 1700))))))
                                        (local.tee 3
                                          (i32.add(local.get 3)
                                            (i32.const 1692))))
                                      (then
                                        (i32.store
                                          (i32.const 1652)
                                          (local.tee 6
                                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 6))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                                                (i32.const -2)
                                                (local.get 2)))(i32.const 1)
)))(i32.const 1)
)))
                                        (br 1 (;@17;))))
                                    (drop
                                      (i32.load
                                        (i32.const 1668)))
                                    (i32.store offset=12
                                      (local.get 0)
                                      (local.get 3))
                                    (i32.store offset=8
                                      (local.get 3)
                                      (local.get 0)))
                                  (local.set 0
                                    (i32.add(local.get 1)
                                      (i32.const 8)))
                                  (i32.store offset=4
                                    (local.get 1)
                                    (i32.or
                                      (local.get 5)
                                      (i32.const 3)))
                                  (i32.store offset=4
                                    (local.tee 7
                                      (i32.add(local.get 1)
                                        (local.get 5)))
                                    (i32.or
                                      (local.tee 3
                                        (i32.sub
                                          (local.tee 2
                                            (i32.shl(local.get 2)
                                              (i32.const 3)))
                                          (local.get 5)))
                                      (i32.const 1)))
                                  (i32.store
                                    (i32.add(local.get 1)
                                      (local.get 2))
                                    (local.get 3))
                                  (if  
                                    (local.get 8)
                                    (then
                                      (local.set 1
                                        (i32.add(i32.shl(local.tee 4
                                              (i32.shr_u
                                                (local.get 8)
                                                (i32.const 3)))
                                            (i32.const 3))
                                          (i32.const 1692)))
                                      (local.set 2
                                        (i32.load
                                          (i32.const 1672)))
                                      (local.set 4
                                        (block (result i32)  
                                          (if  
                                            (i32.eqz
                                              (i32.and(local.get 6)
                                                (local.tee 4
                                                  (i32.shl(i32.const 1)
                                                    (local.get 4)))))
                                            (then
                                              (i32.store
                                                (i32.const 1652)
                                                (i32.or
                                                  (local.get 4)
                                                  (local.get 6)))
                                              (br 1 (;@20;)
                                                (local.get 1))))
                                          (i32.load offset=8
                                            (local.get 1))))
                                      (i32.store offset=8
                                        (local.get 1)
                                        (local.get 2))
                                      (i32.store offset=12
                                        (local.get 4)
                                        (local.get 2))
                                      (i32.store offset=12
                                        (local.get 2)
                                        (local.get 1))
                                      (i32.store offset=8
                                        (local.get 2)
                                        (local.get 4))))
                                  (i32.store
                                    (i32.const 1672)
                                    (local.get 7))
                                  (i32.store
                                    (i32.const 1660)
                                    (local.get 3))
                                  (br 12 (;@9;))))
                              (i32.eqz
                                (local.tee 10
                                  (i32.load
                                    (i32.const 1656))))
                              (br_if 1 (;@20;))
                              (local.set 3
                                (i32.sub
                                  (i32.and(i32.load offset=4
                                      (local.tee 1
                                        (i32.load
                                          (i32.add(i32.shl(i32.add(i32.or
                                                  (i32.or
                                                    (i32.or
                                                      (i32.or
                                                        (local.tee 2
                                                          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                              (local.tee 1
                                                                (i32.shr_u
                                                                  (local.tee 0
                                                                    (i32.add(i32.and(local.get 10)
                                                                        (i32.sub
                                                                          (i32.const 0)
                                                                          (local.get 10)))
                                                                      (i32.const -1)))
                                                                  (local.tee 0
                                                                    (i32.and(i32.shr_u
                                                                        (local.get 0)
                                                                        (i32.const 12))
                                                                      (i32.const 16)))))
                                                              (i32.const 5)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 8))(i32.const 1)
)))(i32.const 1)
))
                                                        (local.get 0))
                                                      (local.tee 1
                                                        (i32.and(i32.shr_u
                                                            (local.tee 0
                                                              (i32.shr_u
                                                                (local.get 1)
                                                                (local.get 2)))
                                                            (i32.const 2))
                                                          (i32.const 4))))
                                                    (local.tee 1
                                                      (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                          (local.tee 0
                                                            (i32.shr_u
                                                              (local.get 0)
                                                              (local.get 1)))
                                                          (i32.const 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 2))(i32.const 1)
)))(i32.const 1)
)))
                                                  (local.tee 1
                                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                        (local.tee 0
                                                          (i32.shr_u
                                                            (local.get 0)
                                                            (local.get 1)))
                                                        (i32.const 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
)))
                                                (i32.shr_u
                                                  (local.get 0)
                                                  (local.get 1)))
                                              (i32.const 2))
                                            (i32.const 1956)))))
                                    (i32.const -8))
                                  (local.get 5)))
                              (local.set 2
                                (local.get 1))
                              (loop  
                                (block  
                                  (if  
                                    (i32.eqz
                                      (local.tee 0
                                        (i32.load offset=16
                                          (local.get 2))))
                                    (then
                                      (br_if 1 (;@23;)
                                        (i32.eqz
                                          (local.tee 0
                                            (i32.load offset=20
                                              (local.get 2)))))))
                                  (local.set 3
                                    (select
                                      (local.tee 2
                                        (i32.sub
                                          (i32.and(i32.load offset=4
                                              (local.get 0))
                                            (i32.const -8))
                                          (local.get 5)))
                                      (local.get 3)
                                      (local.tee 2
                                        (i32.lt_u
                                          (local.get 2)
                                          (local.get 3)))))
                                  (local.set 1
                                    (select
                                      (local.get 0)
                                      (local.get 1)
                                      (local.get 2)))
                                  (local.set 2
                                    (local.get 0))
                                  (br 1 (;@23;))))
                              (local.set 9
                                (i32.load offset=24
                                  (local.get 1)))
                              (if  
                                (i32.ne
                                  (local.get 1)
                                  (local.tee 4
                                    (i32.load offset=12
                                      (local.get 1))))
                                (then
                                  (if  
                                    (i32.le_u
                                      (i32.load
                                        (i32.const 1668))
                                      (local.tee 0
                                        (i32.load offset=8
                                          (local.get 1))))
                                    (then
                                      (drop
                                        (i32.load offset=12
                                          (local.get 0)))))
                                  (i32.store offset=12
                                    (local.get 0)
                                    (local.get 4))
                                  (i32.store offset=8
                                    (local.get 4)
                                    (local.get 0))
                                  (br 11 (;@15;))))
                              (if  
                                (i32.eqz
                                  (local.tee 0
                                    (i32.load
                                      (local.tee 2
                                        (i32.add(local.get 1)
                                          (i32.const 20))))))
                                (then
                                  (br_if 3 (;@24;)
                                    (i32.eqz
                                      (local.tee 0
                                        (i32.load offset=16
                                          (local.get 1)))))
                                  (local.set 2
                                    (i32.add(local.get 1)
                                      (i32.const 16)))))
                              (loop  
                                (local.set 7
                                  (local.get 2))
                                (br_if 0 (;@28;)
                                  (local.tee 0
                                    (i32.load
                                      (local.tee 2
                                        (i32.add(local.tee 4
                                            (local.get 0))
                                          (i32.const 20))))))
                                (local.set 2
                                  (i32.add(local.get 4)
                                    (i32.const 16)))
                                (br_if 0 (;@28;)
                                  (local.tee 0
                                    (i32.load offset=16
                                      (local.get 4)))))
                              (i32.store
                                (local.get 7)
                                (i32.const 0))
                              (br 10 (;@18;))))
                          (local.set 5
                            (i32.const -1))
                          (br_if 0 (;@28;)
                            (i32.gt_u
                              (local.get 0)
                              (i32.const -65)))
                          (local.set 5
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 0
                                (i32.add(local.get 0)
                                  (i32.const 11))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
))
                          (br_if 0 (;@28;)
                            (i32.eqz
                              (local.tee 7
                                (i32.load
                                  (i32.const 1656)))))
                          (local.set 2
                            (i32.sub
                              (i32.const 0)
                              (local.get 5)))
                          (block  
                            (block  
                              (block  
                                (if  
                                  (i32.eqz
                                    (local.tee 3
                                      (i32.load
                                        (i32.add(i32.shl(local.tee 8
                                              (block (result i32)  
                                                (drop
                                                  (br_if 0 (;@33;)
                                                    (i32.const 0)
                                                    (i32.eqz
                                                      (local.tee 0
                                                        (i32.shr_u
                                                          (local.get 0)
                                                          (i32.const 8))))))
                                                (drop
                                                  (br_if 0 (;@33;)
                                                    (i32.const 31)
                                                    (i32.gt_u
                                                      (local.get 5)
                                                      (i32.const 16777215))))
                                                (i32.add(i32.or
                                                    (i32.shl(local.tee 0
                                                        (i32.sub
                                                          (i32.shr_u
                                                            (i32.shl(local.tee 3
                                                                (i32.shl(local.tee 1
                                                                    (i32.shl(local.get 0)
                                                                      (local.tee 0
                                                                        (i32.and(i32.shr_u
                                                                            (i32.add(local.get 0)
                                                                              (i32.const 1048320))
                                                                            (i32.const 16))
                                                                          (i32.const 8)))))
                                                                  (local.tee 1
                                                                    (i32.and(i32.shr_u
                                                                        (i32.add(local.get 1)
                                                                          (i32.const 520192))
                                                                        (i32.const 16))
                                                                      (i32.const 4)))))
                                                              (local.tee 3
                                                                (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                                    (i32.add(local.get 3)
                                                                      (i32.const 245760))
                                                                    (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 2))(i32.const 1)
)))(i32.const 1)
)))
                                                            (i32.const 15))
                                                          (i32.or
                                                            (i32.or
                                                              (local.get 0)
                                                              (local.get 1))
                                                            (local.get 3))))
                                                      (i32.const 1))
                                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                        (local.get 5)
                                                        (i32.add(local.get 0)
                                                          (i32.const 21))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
))
                                                  (i32.const 28))))
                                            (i32.const 2))
                                          (i32.const 1956)))))
                                  (then
                                    (local.set 0
                                      (i32.const 0))
                                    (br 1 (;@32;))))
                                (local.set 1
                                  (i32.shl(local.get 5)
                                    (select
                                      (i32.const 0)
                                      (i32.sub
                                        (i32.const 25)
                                        (i32.shr_u
                                          (local.get 8)
                                          (i32.const 1)))
                                      (i32.eq
                                        (local.get 8)
                                        (i32.const 31)))))
                                (local.set 0
                                  (i32.const 0))
                                (loop  
                                  (block  
                                    (br_if 0 (;@35;)
                                      (i32.ge_u
                                        (local.tee 6
                                          (i32.sub
                                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=4
                                                (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
)
                                            (local.get 5)))
                                        (local.get 2)))
                                    (local.set 4
                                      (local.get 3))
                                    (br_if 0 (;@35;)
                                      (local.tee 2
                                        (local.get 6)))
                                    (local.set 2
                                      (i32.const 0))
                                    (local.set 0
                                      (local.get 3))
                                    (br 3 (;@32;)))
                                  (local.set 0
                                    (select
                                      (select
                                        (local.get 0)
                                        (local.tee 6
                                          (i32.load offset=20
                                            (local.get 3)))
                                        (i32.eq
                                          (local.get 6)
                                          (local.tee 3
                                            (i32.load offset=16
                                              (i32.add(local.get 3)
                                                (i32.and(i32.shr_u
                                                    (local.get 1)
                                                    (i32.const 29))
                                                  (i32.const 4)))))))
                                      (local.get 0)
                                      (local.get 6)))
                                  (local.set 1
                                    (i32.shl(local.get 1)
                                      (i32.ne
                                        (local.get 3)
                                        (i32.const 0))))
                                  (br_if 0 (;@35;)
                                    (local.get 3))))
                              (if  
                                (i32.eqz
                                  (i32.or
                                    (local.get 0)
                                    (local.get 4)))
                                (then
                                  (i32.eqz
                                    (local.tee 0
                                      (i32.and(i32.or
                                          (local.tee 0
                                            (i32.shl(i32.const 2)
                                              (local.get 8)))
                                          (i32.sub
                                            (i32.const 0)
                                            (local.get 0)))
                                        (local.get 7))))
                                  (br_if 3 (;@33;))
                                  (local.set 0
                                    (i32.load
                                      (i32.add(i32.shl(i32.add(i32.or
                                              (i32.or
                                                (i32.or
                                                  (i32.or
                                                    (local.tee 3
                                                      (i32.and(i32.shr_u
                                                          (local.tee 1
                                                            (i32.shr_u
                                                              (local.tee 0
                                                                (i32.add(i32.and(local.get 0)
                                                                    (i32.sub
                                                                      (i32.const 0)
                                                                      (local.get 0)))
                                                                  (i32.const -1)))
                                                              (local.tee 0
                                                                (i32.and(i32.shr_u
                                                                    (local.get 0)
                                                                    (i32.const 12))
                                                                  (i32.const 16)))))
                                                          (i32.const 5))
                                                        (i32.const 8)))
                                                    (local.get 0))
                                                  (local.tee 1
                                                    (i32.and(i32.shr_u
                                                        (local.tee 0
                                                          (i32.shr_u
                                                            (local.get 1)
                                                            (local.get 3)))
                                                        (i32.const 2))
                                                      (i32.const 4))))
                                                (local.tee 1
                                                  (i32.and(i32.shr_u
                                                      (local.tee 0
                                                        (i32.shr_u
                                                          (local.get 0)
                                                          (local.get 1)))
                                                      (i32.const 1))
                                                    (i32.const 2))))
                                              (local.tee 1
                                                (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                    (local.tee 0
                                                      (i32.shr_u
                                                        (local.get 0)
                                                        (local.get 1)))
                                                    (i32.const 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
)))
                                            (i32.shr_u
                                              (local.get 0)
                                              (local.get 1)))
                                          (i32.const 2))
                                        (i32.const 1956))))))
                              (br_if 1 (;@35;)
                                (i32.eqz
                                  (local.get 0))))
                            (loop  
                              (local.set 1
                                (i32.lt_u
                                  (local.tee 3
                                    (i32.sub
                                      (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=4
                                          (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
)
                                      (local.get 5)))
                                  (local.get 2)))
                              (local.set 2
                                (select
                                  (local.get 3)
                                  (local.get 2)
                                  (local.get 1)))
                              (local.set 4
                                (select
                                  (local.get 0)
                                  (local.get 4)
                                  (local.get 1)))
                              (br_if 0 (;@37;)
                                (local.tee 0
                                  (if (result i32)  
                                    (local.tee 1
                                      (i32.load offset=16
                                        (local.get 0)))
                                    (then
                                      (local.get 1))
                                    (else
                                      (i32.load offset=20
                                        (local.get 0))))))))
                          (i32.eqz
                            (local.get 4))
                          (br_if 0 (;@38;)
                            (br_if 0 (;@38;))
                            (i32.ge_u
                              (local.get 2)
                              (i32.sub
                                (i32.load
                                  (i32.const 1660))
                                (local.get 5))))
                          (local.set 8
                            (i32.load offset=24
                              (local.get 4)))
                          (if  
                            (i32.ne
                              (local.get 4)
                              (local.tee 1
                                (i32.load offset=12
                                  (local.get 4))))
                            (then
                              (if  
                                (i32.le_u
                                  (i32.load
                                    (i32.const 1668))
                                  (local.tee 0
                                    (i32.load offset=8
                                      (local.get 4))))
                                (then
                                  (drop
                                    (i32.load offset=12
                                      (local.get 0)))))
                              (i32.store offset=12
                                (local.get 0)
                                (local.get 1))
                              (i32.store offset=8
                                (local.get 1)
                                (local.get 0))
                              (br 9 (;@31;))))
                          (if  
                            (i32.eqz
                              (local.tee 0
                                (i32.load
                                  (local.tee 3
                                    (i32.add(local.get 4)
                                      (i32.const 20))))))
                            (then
                              (i32.eqz
                                (local.tee 0
                                  (i32.load offset=16
                                    (local.get 4))))
                              (br_if 3 (;@38;))
                              (local.set 3
                                (i32.add(local.get 4)
                                  (i32.const 16)))))
                          (loop  
                            (local.set 6
                              (local.get 3))
                            (br_if 0 (;@42;)
                              (local.tee 0
                                (i32.load
                                  (local.tee 3
                                    (i32.add(local.tee 1
                                        (local.get 0))
                                      (i32.const 20))))))
                            (local.set 3
                              (i32.add(local.get 1)
                                (i32.const 16)))
                            (br_if 0 (;@42;)
                              (local.tee 0
                                (i32.load offset=16
                                  (local.get 1)))))
                          (i32.store
                            (local.get 6)
                            (i32.const 0))
                          (br 8 (;@34;)))
                        (if  
                          (i32.ge_u
                            (local.tee 1
                              (i32.load
                                (i32.const 1660)))
                            (local.get 5))
                          (then
                            (local.set 0
                              (i32.load
                                (i32.const 1672)))
                            (block  
                              (if  
                                (i32.ge_u
                                  (local.tee 2
                                    (i32.sub
                                      (local.get 1)
                                      (local.get 5)))
                                  (i32.const 16))
                                (then
                                  (i32.store
                                    (i32.const 1660)
                                    (local.get 2))
                                  (i32.store
                                    (i32.const 1672)
                                    (local.tee 3
                                      (i32.add(local.get 0)
                                        (local.get 5))))
                                  (i32.store offset=4
                                    (local.get 3)
                                    (i32.or
                                      (local.get 2)
                                      (i32.const 1)))
                                  (i32.store
                                    (i32.add(local.get 0)
                                      (local.get 1))
                                    (local.get 2))
                                  (i32.store offset=4
                                    (local.get 0)
                                    (i32.or
                                      (local.get 5)
                                      (i32.const 3)))
                                  (br 1 (;@44;))))
                              (i32.store
                                (i32.const 1672)
                                (i32.const 0))
                              (i32.store
                                (i32.const 1660)
                                (i32.const 0))
                              (i32.store offset=4
                                (local.get 0)
                                (i32.or
                                  (local.get 1)
                                  (i32.const 3)))
                              (i32.store offset=4
                                (local.tee 1
                                  (i32.add(local.get 0)
                                    (local.get 1)))
                                (i32.or
                                  (i32.load offset=4
                                    (local.get 1))
                                  (i32.const 1))))
                            (local.set 0
                              (i32.add(local.get 0)
                                (i32.const 8)))
                            (br 10 (;@35;))))
                        (if  
                          (i32.gt_u
                            (local.tee 1
                              (i32.load
                                (i32.const 1664)))
                            (local.get 5))
                          (then
                            (i32.store
                              (i32.const 1664)
                              (local.tee 1
                                (i32.sub
                                  (local.get 1)
                                  (local.get 5))))
                            (i32.store
                              (i32.const 1676)
                              (local.tee 2
                                (i32.add(local.tee 0
                                    (i32.load
                                      (i32.const 1676)))
                                  (local.get 5))))
                            (i32.store offset=4
                              (local.get 2)
                              (i32.or
                                (local.get 1)
                                (i32.const 1)))
                            (i32.store offset=4
                              (local.get 0)
                              (i32.or
                                (local.get 5)
                                (i32.const 3)))
                            (local.set 0
                              (i32.add(local.get 0)
                                (i32.const 8)))
                            (br 10 (;@36;))))
                        (local.set 0
                          (i32.const 0))
                        (br_if 9 (;@37;)
                          (i32.le_u
                            (local.tee 2
                              (i32.and(local.tee 6
                                  (i32.add(local.tee 4
                                      (i32.add(local.get 5)
                                        (i32.const 47)))
                                    (local.tee 2
                                      (block (result i32)  
                                        (if  
                                          (i32.load
                                            (i32.const 2124))
                                          (then
                                            (br 1 (;@47;)
                                              (i32.load
                                                (i32.const 2132)))))
                                        (i64.store align=4
                                          (i32.const 2136)
                                          (i64.const -1))
                                        (i64.store align=4
                                          (i32.const 2128)
                                          (i64.const 17592186048512))
                                        (i32.store
                                          (i32.const 2124)
                                          (i32.xor(i32.and(i32.add(local.get 11)
                                                (i32.const 12))
                                              (i32.const -16))
                                            (i32.const 1431655768)))
                                        (i32.store
                                          (i32.const 2144)
                                          (i32.const 0))
                                        (i32.store
                                          (i32.const 2096)
                                          (i32.const 0))
                                        (i32.const 4096)))))
                                (local.tee 7
                                  (i32.sub
                                    (i32.const 0)
                                    (local.get 2)))))
                            (local.get 5)))
                        (if  
                          (local.tee 3
                            (i32.load
                              (i32.const 2092)))
                          (then
                            (br_if 10 (;@39;)
                              (i32.le_u
                                (local.tee 9
                                  (i32.add(local.tee 8
                                      (i32.load
                                        (i32.const 2084)))
                                    (local.get 2)))
                                (local.get 8)))
                            (br_if 10 (;@39;)
                              (i32.gt_u
                                (local.get 9)
                                (local.get 3)))))
                        (br_if 4 (;@45;)
                          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load8_u
                              (i32.const 2096)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
))
                        (block  
                          (block  
                            (if  
                              (local.tee 3
                                (i32.load
                                  (i32.const 1676)))
                              (then
                                (local.set 0
                                  (i32.const 2100))
                                (loop  
                                  (if  
                                    (i32.le_u
                                      (local.tee 8
                                        (i32.load
                                          (local.get 0)))
                                      (local.get 3))
                                    (then
                                      (br_if 3 (;@51;)
                                        (i32.gt_u
                                          (i32.add(local.get 8)
                                            (i32.load offset=4
                                              (local.get 0)))
                                          (local.get 3)))))
                                  (br_if 0 (;@54;)
                                    (local.tee 0
                                      (i32.load offset=8
                                        (local.get 0)))))))
                            (br_if 5 (;@49;)
                              (i32.eq
                                (local.tee 1
                                  (call $sbrk
                                    (i32.const 0)))
                                (i32.const -1)))
                            (local.set 6
                              (local.get 2))
                            (if  
                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 3
                                  (i32.add(local.tee 0
                                      (i32.load
                                        (i32.const 2128)))
                                    (i32.const -1))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)))(i32.const 1)
)
                              (then
                                (local.set 6
                                  (i32.add(i32.sub
                                      (local.get 2)
                                      (local.get 1))
                                    (i32.and(i32.add(local.get 1)
                                        (local.get 3))
                                      (i32.sub
                                        (i32.const 0)
                                        (local.get 0)))))))
                            (br_if 5 (;@50;)
                              (i32.le_u
                                (local.get 6)
                                (local.get 5)))
                            (br_if 5 (;@50;)
                              (i32.gt_u
                                (local.get 6)
                                (i32.const 2147483646)))
                            (if  
                              (local.tee 0
                                (i32.load
                                  (i32.const 2092)))
                              (then
                                (br_if 6 (;@50;)
                                  (i32.le_u
                                    (local.tee 7
                                      (i32.add(local.tee 3
                                          (i32.load
                                            (i32.const 2084)))
                                        (local.get 6)))
                                    (local.get 3)))
                                (br_if 6 (;@50;)
                                  (i32.gt_u
                                    (local.get 7)
                                    (local.get 0)))))
                            (br_if 1 (;@55;)
                              (i32.ne
                                (local.tee 0
                                  (call $sbrk
                                    (local.get 6)))
                                (local.get 1)))
                            (br 7 (;@49;)))
                          (br_if 4 (;@52;)
                            (i32.gt_u
                              (local.tee 6
                                (i32.and(i32.sub
                                    (local.get 6)
                                    (local.get 1))
                                  (local.get 7)))
                              (i32.const 2147483646)))
                          (br_if 3 (;@53;)
                            (i32.eq
                              (local.tee 1
                                (call $sbrk
                                  (local.get 6)))
                              (i32.add(i32.load
                                  (local.get 0))
                                (i32.load offset=4
                                  (local.get 0)))))
                          (local.set 0
                            (local.get 1)))
                        (block  
                          (br_if 0 (;@57;)
                            (i32.le_u
                              (i32.add(local.get 5)
                                (i32.const 48))
                              (local.get 6)))
                          (br_if 0 (;@57;)
                            (i32.eq
                              (local.get 0)
                              (i32.const -1)))
                          (if  
                            (i32.gt_u
                              (local.tee 1
                                (i32.and(i32.add(local.tee 1
                                      (i32.load
                                        (i32.const 2132)))
                                    (i32.sub
                                      (local.get 4)
                                      (local.get 6)))
                                  (i32.sub
                                    (i32.const 0)
                                    (local.get 1))))
                              (i32.const 2147483646))
                            (then
                              (local.set 1
                                (local.get 0))
                              (br 7 (;@51;))))
                          (if  
                            (i32.ne
                              (call $sbrk
                                (local.get 1))
                              (i32.const -1))
                            (then
                              (local.set 6
                                (i32.add(local.get 1)
                                  (local.get 6)))
                              (local.set 1
                                (local.get 0))
                              (br 7 (;@52;))))
                          (drop
                            (call $sbrk
                              (i32.sub
                                (i32.const 0)
                                (local.get 6))))
                          (br 4 (;@55;)))
                        (br_if 5 (;@54;)
                          (i32.ne
                            (local.tee 1
                              (local.get 0))
                            (i32.const -1)))
                        (br 3 (;@56;)))
                      (local.set 4
                        (i32.const 0))
                      (br 7 (;@52;)))
                    (local.set 1
                      (i32.const 0))
                    (br 5 (;@54;)))
                  (br_if 2 (;@57;)
                    (i32.ne
                      (local.get 1)
                      (i32.const -1))))
                (i32.store
                  (i32.const 2096)
                  (i32.or
                    (i32.load
                      (i32.const 2096))
                    (i32.const 4))))
              (br_if 1 (;@58;)
                (i32.gt_u
                  (local.get 2)
                  (i32.const 2147483646)))
              (br_if 1 (;@58;)
                (i32.ge_u
                  (local.tee 1
                    (call $sbrk
                      (local.get 2)))
                  (local.tee 0
                    (call $sbrk
                      (i32.const 0)))))
              (br_if 1 (;@58;)
                (i32.eq
                  (local.get 1)
                  (i32.const -1)))
              (br_if 1 (;@58;)
                (i32.eq
                  (local.get 0)
                  (i32.const -1)))
              (br_if 1 (;@58;)
                (i32.le_u
                  (local.tee 6
                    (i32.sub
                      (local.get 0)
                      (local.get 1)))
                  (i32.add(local.get 5)
                    (i32.const 40)))))
            (i32.store
              (i32.const 2084)
              (local.tee 0
                (i32.add(i32.load
                    (i32.const 2084))
                  (local.get 6))))
            (if  
              (i32.gt_u
                (local.get 0)
                (i32.load
                  (i32.const 2088)))
              (then
                (i32.store
                  (i32.const 2088)
                  (local.get 0))))
            (block  
              (block  
                (block  
                  (if  
                    (local.tee 3
                      (i32.load
                        (i32.const 1676)))
                    (then
                      (local.set 0
                        (i32.const 2100))
                      (loop  
                        (br_if 2 (;@63;)
                          (i32.eq
                            (local.get 1)
                            (i32.add(local.tee 2
                                (i32.load
                                  (local.get 0)))
                              (local.tee 4
                                (i32.load offset=4
                                  (local.get 0))))))
                        (br_if 0 (;@65;)
                          (local.tee 0
                            (i32.load offset=8
                              (local.get 0)))))
                      (br 2 (;@63;))))
                  (if  
                    (i32.eqz
                      (select
                        (local.tee 0
                          (i32.load
                            (i32.const 1668)))
                        (i32.const 0)
                        (i32.ge_u
                          (local.get 1)
                          (local.get 0))))
                    (then
                      (i32.store
                        (i32.const 1668)
                        (local.get 1))))
                  (local.set 0
                    (i32.const 0))
                  (i32.store
                    (i32.const 2104)
                    (local.get 6))
                  (i32.store
                    (i32.const 2100)
                    (local.get 1))
                  (i32.store
                    (i32.const 1684)
                    (i32.const -1))
                  (i32.store
                    (i32.const 1688)
                    (i32.load
                      (i32.const 2124)))
                  (i32.store
                    (i32.const 2112)
                    (i32.const 0))
                  (loop  
                    (i32.store
                      (i32.add(local.tee 2
                          (i32.shl(local.get 0)
                            (i32.const 3)))
                        (i32.const 1700))
                      (local.tee 3
                        (i32.add(local.get 2)
                          (i32.const 1692))))
                    (i32.store
                      (i32.add(local.get 2)
                        (i32.const 1704))
                      (local.get 3))
                    (br_if 0 (;@67;)
                      (i32.ne
                        (local.tee 0
                          (i32.add(local.get 0)
                            (i32.const 1)))
                        (i32.const 32))))
                  (i32.store
                    (i32.const 1664)
                    (local.tee 3
                      (i32.sub
                        (local.tee 0
                          (i32.add(local.get 6)
                            (i32.const -40)))
                        (local.tee 2
                          (select
                            (i32.and(i32.sub
                                (i32.const -8)
                                (local.get 1))
                              (i32.const 7))
                            (i32.const 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.add(local.get 1)
                                (i32.const 8)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 7))(i32.const 1)
)))(i32.const 1)
))))))
                  (i32.store
                    (i32.const 1676)
                    (local.tee 2
                      (i32.add(local.get 1)
                        (local.get 2))))
                  (i32.store offset=4
                    (local.get 2)
                    (i32.or
                      (local.get 3)
                      (i32.const 1)))
                  (i32.store offset=4
                    (i32.add(local.get 0)
                      (local.get 1))
                    (i32.const 40))
                  (i32.store
                    (i32.const 1680)
                    (i32.load
                      (i32.const 2140)))
                  (br 2 (;@65;)))
                (br_if 0 (;@67;)
                  (i32.and(i32.load8_u offset=12
                      (local.get 0))
                    (i32.const 8)))
                (br_if 0 (;@67;)
                  (i32.le_u
                    (local.get 1)
                    (local.get 3)))
                (br_if 0 (;@67;)
                  (i32.gt_u
                    (local.get 2)
                    (local.get 3)))
                (i32.store offset=4
                  (local.get 0)
                  (i32.add(local.get 4)
                    (local.get 6)))
                (i32.store
                  (i32.const 1676)
                  (local.tee 1
                    (i32.add(local.get 3)
                      (local.tee 0
                        (select
                          (i32.and(i32.sub
                              (i32.const -8)
                              (local.get 3))
                            (i32.const 7))
                          (i32.const 0)
                          (i32.and(i32.add(local.get 3)
                              (i32.const 8))
                            (i32.const 7)))))))
                (i32.store
                  (i32.const 1664)
                  (local.tee 0
                    (i32.sub
                      (local.tee 2
                        (i32.add(i32.load
                            (i32.const 1664))
                          (local.get 6)))
                      (local.get 0))))
                (i32.store offset=4
                  (local.get 1)
                  (i32.or
                    (local.get 0)
                    (i32.const 1)))
                (i32.store offset=4
                  (i32.add(local.get 2)
                    (local.get 3))
                  (i32.const 40))
                (i32.store
                  (i32.const 1680)
                  (i32.load
                    (i32.const 2140)))
                (br 1 (;@66;)))
              (if  
                (i32.lt_u
                  (local.get 1)
                  (local.tee 4
                    (i32.load
                      (i32.const 1668))))
                (then
                  (i32.store
                    (i32.const 1668)
                    (local.get 1))
                  (local.set 4
                    (local.get 1))))
              (local.set 2
                (i32.add(local.get 1)
                  (local.get 6)))
              (local.set 0
                (i32.const 2100))
              (block  
                (block  
                  (block  
                    (block  
                      (block  
                        (block  
                          (loop  
                            (if  
                              (i32.ne
                                (local.get 2)
                                (i32.load
                                  (local.get 0)))
                              (then
                                (br_if 1 (;@75;)
                                  (local.tee 0
                                    (i32.load offset=8
                                      (local.get 0))))
                                (br 2 (;@74;)))))
                          (br_if 1 (;@75;)
                            (i32.eqz
                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load8_u offset=12
                                  (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 8))(i32.const 1)
)))(i32.const 1)
))))
                        (local.set 0
                          (i32.const 2100))
                        (loop  
                          (if  
                            (i32.le_u
                              (local.tee 2
                                (i32.load
                                  (local.get 0)))
                              (local.get 3))
                            (then
                              (br_if 3 (;@75;)
                                (i32.gt_u
                                  (local.tee 4
                                    (i32.add(local.get 2)
                                      (i32.load offset=4
                                        (local.get 0))))
                                  (local.get 3)))))
                          (local.set 0
                            (i32.load offset=8
                              (local.get 0)))
                          (br 0 (;@78;))
                          (unreachable))
                        (unreachable))
                      (i32.store
                        (local.get 0)
                        (local.get 1))
                      (i32.store offset=4
                        (local.get 0)
                        (i32.add(i32.load offset=4
                            (local.get 0))
                          (local.get 6)))
                      (i32.store offset=4
                        (local.tee 9
                          (i32.add(local.get 1)
                            (select
                              (i32.and(i32.sub
                                  (i32.const -8)
                                  (local.get 1))
                                (i32.const 7))
                              (i32.const 0)
                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.add(local.get 1)
                                  (i32.const 8)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 7))(i32.const 1)
)))(i32.const 1)
))))
                        (i32.or
                          (local.get 5)
                          (i32.const 3)))
                      (local.set 0
                        (i32.sub
                          (i32.sub
                            (local.tee 1
                              (i32.add(local.get 2)
                                (select
                                  (i32.and(i32.sub
                                      (i32.const -8)
                                      (local.get 2))
                                    (i32.const 7))
                                  (i32.const 0)
                                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.add(local.get 2)
                                      (i32.const 8)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 7))(i32.const 1)
)))(i32.const 1)
))))
                            (local.get 9))
                          (local.get 5)))
                      (local.set 7
                        (i32.add(local.get 5)
                          (local.get 9)))
                      (if  
                        (i32.eq
                          (local.get 1)
                          (local.get 3))
                        (then
                          (i32.store
                            (i32.const 1676)
                            (local.get 7))
                          (i32.store
                            (i32.const 1664)
                            (local.tee 0
                              (i32.add(i32.load
                                  (i32.const 1664))
                                (local.get 0))))
                          (i32.store offset=4
                            (local.get 7)
                            (i32.or
                              (local.get 0)
                              (i32.const 1)))
                          (br 3 (;@76;))))
                      (if  
                        (i32.eq
                          (local.get 1)
                          (i32.load
                            (i32.const 1672)))
                        (then
                          (i32.store
                            (i32.const 1672)
                            (local.get 7))
                          (i32.store
                            (i32.const 1660)
                            (local.tee 0
                              (i32.add(i32.load
                                  (i32.const 1660))
                                (local.get 0))))
                          (i32.store offset=4
                            (local.get 7)
                            (i32.or
                              (local.get 0)
                              (i32.const 1)))
                          (i32.store
                            (i32.add(local.get 0)
                              (local.get 7))
                            (local.get 0))
                          (br 3 (;@77;))))
                      (if  
                        (i32.eq
                          (i32.and(local.tee 2
                              (i32.load offset=4
                                (local.get 1)))
                            (i32.const 3))
                          (i32.const 1))
                        (then
                          (local.set 10
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 2))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
))
                          (block  
                            (if  
                              (i32.le_u
                                (local.get 2)
                                (i32.const 255))
                              (then
                                (drop
                                  (i32.ne
                                    (local.tee 3
                                      (i32.load offset=8
                                        (local.get 1)))
                                    (i32.add(i32.shl(local.tee 4
                                          (i32.shr_u
                                            (local.get 2)
                                            (i32.const 3)))
                                        (i32.const 3))
                                      (i32.const 1692))))
                                (if  
                                  (i32.eq
                                    (local.get 3)
                                    (local.tee 2
                                      (i32.load offset=12
                                        (local.get 1))))
                                  (then
                                    (i32.store
                                      (i32.const 1652)
                                      (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                          (i32.const 1652)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                                          (i32.const -2)
                                          (local.get 4)))(i32.const 1)
)))(i32.const 1)
))
                                    (br 2 (;@82;))))
                                (i32.store offset=12
                                  (local.get 3)
                                  (local.get 2))
                                (i32.store offset=8
                                  (local.get 2)
                                  (local.get 3))
                                (br 1 (;@83;))))
                            (local.set 8
                              (i32.load offset=24
                                (local.get 1)))
                            (block  
                              (if  
                                (i32.ne
                                  (local.get 1)
                                  (local.tee 6
                                    (i32.load offset=12
                                      (local.get 1))))
                                (then
                                  (if  
                                    (i32.le_u
                                      (local.get 4)
                                      (local.tee 2
                                        (i32.load offset=8
                                          (local.get 1))))
                                    (then
                                      (drop
                                        (i32.load offset=12
                                          (local.get 2)))))
                                  (i32.store offset=12
                                    (local.get 2)
                                    (local.get 6))
                                  (i32.store offset=8
                                    (local.get 6)
                                    (local.get 2))
                                  (br 1 (;@86;))))
                              (block  
                                (br_if 0 (;@88;)
                                  (local.tee 5
                                    (i32.load
                                      (local.tee 3
                                        (i32.add(local.get 1)
                                          (i32.const 20))))))
                                (br_if 0 (;@88;)
                                  (local.tee 5
                                    (i32.load
                                      (local.tee 3
                                        (i32.add(local.get 1)
                                          (i32.const 16))))))
                                (local.set 6
                                  (i32.const 0))
                                (br 1 (;@87;)))
                              (loop  
                                (local.set 2
                                  (local.get 3))
                                (br_if 0 (;@89;)
                                  (local.tee 5
                                    (i32.load
                                      (local.tee 3
                                        (i32.add(local.tee 6
                                            (local.get 5))
                                          (i32.const 20))))))
                                (local.set 3
                                  (i32.add(local.get 6)
                                    (i32.const 16)))
                                (br_if 0 (;@89;)
                                  (local.tee 5
                                    (i32.load offset=16
                                      (local.get 6)))))
                              (i32.store
                                (local.get 2)
                                (i32.const 0)))
                            (br_if 0 (;@89;)
                              (i32.eqz
                                (local.get 8)))
                            (block  
                              (if  
                                (i32.eq
                                  (local.get 1)
                                  (i32.load
                                    (local.tee 3
                                      (i32.add(i32.shl(local.tee 2
                                            (i32.load offset=28
                                              (local.get 1)))
                                          (i32.const 2))
                                        (i32.const 1956)))))
                                (then
                                  (i32.store
                                    (local.get 3)
                                    (local.get 6))
                                  (br_if 1 (;@90;)
                                    (local.get 6))
                                  (i32.store
                                    (i32.const 1656)
                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                        (i32.const 1656)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                                        (i32.const -2)
                                        (local.get 2)))(i32.const 1)
)))(i32.const 1)
))
                                  (br 2 (;@89;))))
                              (i32.store
                                (i32.add(local.get 8)
                                  (select
                                    (i32.const 16)
                                    (i32.const 20)
                                    (i32.eq
                                      (i32.load offset=16
                                        (local.get 8))
                                      (local.get 1))))
                                (local.get 6))
                              (br_if 1 (;@90;)
                                (i32.eqz
                                  (local.get 6))))
                            (i32.store offset=24
                              (local.get 6)
                              (local.get 8))
                            (if  
                              (local.tee 2
                                (i32.load offset=16
                                  (local.get 1)))
                              (then
                                (i32.store offset=16
                                  (local.get 6)
                                  (local.get 2))
                                (i32.store offset=24
                                  (local.get 2)
                                  (local.get 6))))
                            (br_if 0 (;@92;)
                              (i32.eqz
                                (local.tee 2
                                  (i32.load offset=20
                                    (local.get 1)))))
                            (i32.store offset=20
                              (local.get 6)
                              (local.get 2))
                            (i32.store offset=24
                              (local.get 2)
                              (local.get 6)))
                          (local.set 1
                            (i32.add(local.get 1)
                              (local.get 10)))
                          (local.set 0
                            (i32.add(local.get 0)
                              (local.get 10)))))
                      (i32.store offset=4
                        (local.get 1)
                        (i32.and(i32.load offset=4
                            (local.get 1))
                          (i32.const -2)))
                      (i32.store offset=4
                        (local.get 7)
                        (i32.or
                          (local.get 0)
                          (i32.const 1)))
                      (i32.store
                        (i32.add(local.get 0)
                          (local.get 7))
                        (local.get 0))
                      (if  
                        (i32.le_u
                          (local.get 0)
                          (i32.const 255))
                        (then
                          (local.set 0
                            (i32.add(i32.shl(local.tee 1
                                  (i32.shr_u
                                    (local.get 0)
                                    (i32.const 3)))
                                (i32.const 3))
                              (i32.const 1692)))
                          (local.set 1
                            (block (result i32)  
                              (if  
                                (i32.eqz
                                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 2
                                      (i32.load
                                        (i32.const 1652))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 1
                                      (i32.shl(i32.const 1)
                                        (local.get 1))))(i32.const 1)
)))(i32.const 1)
))
                                (then
                                  (i32.store
                                    (i32.const 1652)
                                    (i32.or
                                      (local.get 1)
                                      (local.get 2)))
                                  (br 1 (;@94;)
                                    (local.get 0))))
                              (i32.load offset=8
                                (local.get 0))))
                          (i32.store offset=8
                            (local.get 0)
                            (local.get 7))
                          (i32.store offset=12
                            (local.get 1)
                            (local.get 7))
                          (i32.store offset=12
                            (local.get 7)
                            (local.get 0))
                          (i32.store offset=8
                            (local.get 7)
                            (local.get 1))
                          (br 3 (;@92;))))
                      (i32.store offset=28
                        (local.get 7)
                        (local.tee 1
                          (block (result i32)  
                            (drop
                              (br_if 0 (;@96;)
                                (i32.const 0)
                                (i32.eqz
                                  (local.tee 1
                                    (i32.shr_u
                                      (local.get 0)
                                      (i32.const 8))))))
                            (drop
                              (br_if 0 (;@96;)
                                (i32.const 31)
                                (i32.gt_u
                                  (local.get 0)
                                  (i32.const 16777215))))
                            (i32.add(i32.or
                                (i32.shl(local.tee 1
                                    (i32.sub
                                      (i32.shr_u
                                        (i32.shl(local.tee 3
                                            (i32.shl(local.tee 2
                                                (i32.shl(local.get 1)
                                                  (local.tee 1
                                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                        (i32.add(local.get 1)
                                                          (i32.const 1048320))
                                                        (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 8))(i32.const 1)
)))(i32.const 1)
))))
                                              (local.tee 2
                                                (i32.and(i32.shr_u
                                                    (i32.add(local.get 2)
                                                      (i32.const 520192))
                                                    (i32.const 16))
                                                  (i32.const 4)))))
                                          (local.tee 3
                                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                (i32.add(local.get 3)
                                                  (i32.const 245760))
                                                (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 2))(i32.const 1)
)))(i32.const 1)
)))
                                        (i32.const 15))
                                      (i32.or
                                        (i32.or
                                          (local.get 1)
                                          (local.get 2))
                                        (local.get 3))))
                                  (i32.const 1))
                                (i32.and(i32.shr_u
                                    (local.get 0)
                                    (i32.add(local.get 1)
                                      (i32.const 21)))
                                  (i32.const 1)))
                              (i32.const 28)))))
                      (i64.store offset=16 align=4
                        (local.get 7)
                        (i64.const 0))
                      (local.set 2
                        (i32.add(i32.shl(local.get 1)
                            (i32.const 2))
                          (i32.const 1956)))
                      (block  
                        (if  
                          (i32.eqz
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 3
                                (i32.load
                                  (i32.const 1656))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 4
                                (i32.shl(i32.const 1)
                                  (local.get 1))))(i32.const 1)
)))(i32.const 1)
))
                          (then
                            (i32.store
                              (i32.const 1656)
                              (i32.or
                                (local.get 3)
                                (local.get 4)))
                            (i32.store
                              (local.get 2)
                              (local.get 7))
                            (br 1 (;@97;))))
                        (local.set 3
                          (i32.shl(local.get 0)
                            (select
                              (i32.const 0)
                              (i32.sub
                                (i32.const 25)
                                (i32.shr_u
                                  (local.get 1)
                                  (i32.const 1)))
                              (i32.eq
                                (local.get 1)
                                (i32.const 31)))))
                        (local.set 1
                          (i32.load
                            (local.get 2)))
                        (loop  
                          (i32.eq
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=4
                                (local.tee 2
                                  (local.get 1))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
)
                            (local.get 0))
                          (br_if 3 (;@96;))
                          (local.set 1
                            (i32.shr_u
                              (local.get 3)
                              (i32.const 29)))
                          (local.set 3
                            (i32.shl(local.get 3)
                              (i32.const 1)))
                          (br_if 0 (;@99;)
                            (local.tee 1
                              (i32.load offset=16
                                (local.tee 4
                                  (i32.add(local.get 2)
                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
)))))))
                        (i32.store offset=16
                          (local.get 4)
                          (local.get 7)))
                      (i32.store offset=24
                        (local.get 7)
                        (local.get 2))
                      (i32.store offset=12
                        (local.get 7)
                        (local.get 7))
                      (i32.store offset=8
                        (local.get 7)
                        (local.get 7))
                      (br 2 (;@97;)))
                    (i32.store
                      (i32.const 1664)
                      (local.tee 7
                        (i32.sub
                          (local.tee 0
                            (i32.add(local.get 6)
                              (i32.const -40)))
                          (local.tee 2
                            (select
                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.sub
                                  (i32.const -8)
                                  (local.get 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 7))(i32.const 1)
)))(i32.const 1)
)
                              (i32.const 0)
                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.add(local.get 1)
                                  (i32.const 8)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 7))(i32.const 1)
)))(i32.const 1)
))))))
                    (i32.store
                      (i32.const 1676)
                      (local.tee 2
                        (i32.add(local.get 1)
                          (local.get 2))))
                    (i32.store offset=4
                      (local.get 2)
                      (i32.or
                        (local.get 7)
                        (i32.const 1)))
                    (i32.store offset=4
                      (i32.add(local.get 0)
                        (local.get 1))
                      (i32.const 40))
                    (i32.store
                      (i32.const 1680)
                      (i32.load
                        (i32.const 2140)))
                    (i32.store offset=4
                      (local.tee 2
                        (select
                          (local.get 3)
                          (local.tee 0
                            (i32.add(i32.add(local.get 4)
                                (select
                                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.sub
                                      (i32.const 39)
                                      (local.get 4)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 7))(i32.const 1)
)))(i32.const 1)
)
                                  (i32.const 0)
                                  (i32.and(i32.add(local.get 4)
                                      (i32.const -39))
                                    (i32.const 7))))
                              (i32.const -47)))
                          (i32.lt_u
                            (local.get 0)
                            (i32.add(local.get 3)
                              (i32.const 16)))))
                      (i32.const 27))
                    (i64.store offset=16 align=4
                      (local.get 2)
                      (i64.load align=4
                        (i32.const 2108)))
                    (i64.store offset=8 align=4
                      (local.get 2)
                      (i64.load align=4
                        (i32.const 2100)))
                    (i32.store
                      (i32.const 2108)
                      (i32.add(local.get 2)
                        (i32.const 8)))
                    (i32.store
                      (i32.const 2104)
                      (local.get 6))
                    (i32.store
                      (i32.const 2100)
                      (local.get 1))
                    (i32.store
                      (i32.const 2112)
                      (i32.const 0))
                    (local.set 0
                      (i32.add(local.get 2)
                        (i32.const 24)))
                    (loop  
                      (i32.store offset=4
                        (local.get 0)
                        (i32.const 7))
                      (local.set 1
                        (i32.add(local.get 0)
                          (i32.const 8)))
                      (local.set 0
                        (i32.add(local.get 0)
                          (i32.const 4)))
                      (br_if 0 (;@100;)
                        (i32.gt_u
                          (local.get 4)
                          (local.get 1))))
                    (br_if 3 (;@97;)
                      (i32.eq
                        (local.get 2)
                        (local.get 3)))
                    (i32.store offset=4
                      (local.get 2)
                      (i32.and(i32.load offset=4
                          (local.get 2))
                        (i32.const -2)))
                    (i32.store offset=4
                      (local.get 3)
                      (i32.or
                        (local.tee 4
                          (i32.sub
                            (local.get 2)
                            (local.get 3)))
                        (i32.const 1)))
                    (i32.store
                      (local.get 2)
                      (local.get 4))
                    (if  
                      (i32.le_u
                        (local.get 4)
                        (i32.const 255))
                      (then
                        (local.set 0
                          (i32.add(i32.shl(local.tee 1
                                (i32.shr_u
                                  (local.get 4)
                                  (i32.const 3)))
                              (i32.const 3))
                            (i32.const 1692)))
                        (local.set 1
                          (block (result i32)  
                            (if  
                              (i32.eqz
                                (i32.and(local.tee 2
                                    (i32.load
                                      (i32.const 1652)))
                                  (local.tee 1
                                    (i32.shl(i32.const 1)
                                      (local.get 1)))))
                              (then
                                (i32.store
                                  (i32.const 1652)
                                  (i32.or
                                    (local.get 1)
                                    (local.get 2)))
                                (br 1 (;@102;)
                                  (local.get 0))))
                            (i32.load offset=8
                              (local.get 0))))
                        (i32.store offset=8
                          (local.get 0)
                          (local.get 3))
                        (i32.store offset=12
                          (local.get 1)
                          (local.get 3))
                        (i32.store offset=12
                          (local.get 3)
                          (local.get 0))
                        (i32.store offset=8
                          (local.get 3)
                          (local.get 1))
                        (br 4 (;@99;))))
                    (i64.store offset=16 align=4
                      (local.get 3)
                      (i64.const 0))
                    (i32.store offset=28
                      (local.get 3)
                      (local.tee 0
                        (block (result i32)  
                          (drop
                            (br_if 0 (;@104;)
                              (i32.const 0)
                              (i32.eqz
                                (local.tee 0
                                  (i32.shr_u
                                    (local.get 4)
                                    (i32.const 8))))))
                          (drop
                            (br_if 0 (;@104;)
                              (i32.const 31)
                              (i32.gt_u
                                (local.get 4)
                                (i32.const 16777215))))
                          (i32.add(i32.or
                              (i32.shl(local.tee 0
                                  (i32.sub
                                    (i32.shr_u
                                      (i32.shl(local.tee 2
                                          (i32.shl(local.tee 1
                                              (i32.shl(local.get 0)
                                                (local.tee 0
                                                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                      (i32.add(local.get 0)
                                                        (i32.const 1048320))
                                                      (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 8))(i32.const 1)
)))(i32.const 1)
))))
                                            (local.tee 1
                                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                                  (i32.add(local.get 1)
                                                    (i32.const 520192))
                                                  (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
))))
                                        (local.tee 2
                                          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                              (i32.add(local.get 2)
                                                (i32.const 245760))
                                              (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 2))(i32.const 1)
)))(i32.const 1)
)))
                                      (i32.const 15))
                                    (i32.or
                                      (i32.or
                                        (local.get 0)
                                        (local.get 1))
                                      (local.get 2))))
                                (i32.const 1))
                              (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                  (local.get 4)
                                  (i32.add(local.get 0)
                                    (i32.const 21))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
))
                            (i32.const 28)))))
                    (local.set 1
                      (i32.add(i32.shl(local.get 0)
                          (i32.const 2))
                        (i32.const 1956)))
                    (block  
                      (if  
                        (i32.eqz
                          (i32.and(local.tee 2
                              (i32.load
                                (i32.const 1656)))
                            (local.tee 6
                              (i32.shl(i32.const 1)
                                (local.get 0)))))
                        (then
                          (i32.store
                            (i32.const 1656)
                            (i32.or
                              (local.get 2)
                              (local.get 6)))
                          (i32.store
                            (local.get 1)
                            (local.get 3))
                          (i32.store offset=24
                            (local.get 3)
                            (local.get 1))
                          (br 1 (;@105;))))
                      (local.set 0
                        (i32.shl(local.get 4)
                          (select
                            (i32.const 0)
                            (i32.sub
                              (i32.const 25)
                              (i32.shr_u
                                (local.get 0)
                                (i32.const 1)))
                            (i32.eq
                              (local.get 0)
                              (i32.const 31)))))
                      (local.set 1
                        (i32.load
                          (local.get 1)))
                      (loop  
                        (br_if 4 (;@103;)
                          (i32.eq
                            (i32.and(i32.load offset=4
                                (local.tee 2
                                  (local.get 1)))
                              (i32.const -8))
                            (local.get 4)))
                        (local.set 1
                          (i32.shr_u
                            (local.get 0)
                            (i32.const 29)))
                        (local.set 0
                          (i32.shl(local.get 0)
                            (i32.const 1)))
                        (br_if 0 (;@107;)
                          (local.tee 1
                            (i32.load offset=16
                              (local.tee 6
                                (i32.add(local.get 2)
                                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
)))))))
                      (i32.store offset=16
                        (local.get 6)
                        (local.get 3))
                      (i32.store offset=24
                        (local.get 3)
                        (local.get 2)))
                    (i32.store offset=12
                      (local.get 3)
                      (local.get 3))
                    (i32.store offset=8
                      (local.get 3)
                      (local.get 3))
                    (br 3 (;@104;)))
                  (i32.store offset=12
                    (local.tee 0
                      (i32.load offset=8
                        (local.get 2)))
                    (local.get 7))
                  (i32.store offset=8
                    (local.get 2)
                    (local.get 7))
                  (i32.store offset=24
                    (local.get 7)
                    (i32.const 0))
                  (i32.store offset=12
                    (local.get 7)
                    (local.get 2))
                  (i32.store offset=8
                    (local.get 7)
                    (local.get 0)))
                (local.set 0
                  (i32.add(local.get 9)
                    (i32.const 8)))
                (br 5 (;@102;)))
              (i32.store offset=12
                (local.tee 0
                  (i32.load offset=8
                    (local.get 2)))
                (local.get 3))
              (i32.store offset=8
                (local.get 2)
                (local.get 3))
              (i32.store offset=24
                (local.get 3)
                (i32.const 0))
              (i32.store offset=12
                (local.get 3)
                (local.get 2))
              (i32.store offset=8
                (local.get 3)
                (local.get 0)))
            (br_if 0 (;@107;)
              (i32.le_u
                (local.tee 0
                  (i32.load
                    (i32.const 1664)))
                (local.get 5)))
            (i32.store
              (i32.const 1664)
              (local.tee 1
                (i32.sub
                  (local.get 0)
                  (local.get 5))))
            (i32.store
              (i32.const 1676)
              (local.tee 2
                (i32.add(local.tee 0
                    (i32.load
                      (i32.const 1676)))
                  (local.get 5))))
            (i32.store offset=4
              (local.get 2)
              (i32.or
                (local.get 1)
                (i32.const 1)))
            (i32.store offset=4
              (local.get 0)
              (i32.or
                (local.get 5)
                (i32.const 3)))
            (local.set 0
              (i32.add(local.get 0)
                (i32.const 8)))
            (br 3 (;@104;)))
          (i32.store
            (i32.const 1648)
            (i32.const 48))
          (local.set 0
            (i32.const 0))
          (br 2 (;@105;)))
        (block  
          (br_if 0 (;@108;)
            (i32.eqz
              (local.get 8)))
          (block  
            (if  
              (i32.eq
                (i32.load
                  (local.tee 3
                    (i32.add(i32.shl(local.tee 0
                          (i32.load offset=28
                            (local.get 4)))
                        (i32.const 2))
                      (i32.const 1956))))
                (local.get 4))
              (then
                (i32.store
                  (local.get 3)
                  (local.get 1))
                (br_if 1 (;@109;)
                  (local.get 1))
                (i32.store
                  (i32.const 1656)
                  (local.tee 7
                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 7))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                        (i32.const -2)
                        (local.get 0)))(i32.const 1)
)))(i32.const 1)
)))
                (br 2 (;@108;))))
            (i32.store
              (i32.add(local.get 8)
                (select
                  (i32.const 16)
                  (i32.const 20)
                  (i32.eq
                    (i32.load offset=16
                      (local.get 8))
                    (local.get 4))))
              (local.get 1))
            (br_if 1 (;@109;)
              (i32.eqz
                (local.get 1))))
          (i32.store offset=24
            (local.get 1)
            (local.get 8))
          (if  
            (local.tee 0
              (i32.load offset=16
                (local.get 4)))
            (then
              (i32.store offset=16
                (local.get 1)
                (local.get 0))
              (i32.store offset=24
                (local.get 0)
                (local.get 1))))
          (br_if 0 (;@111;)
            (i32.eqz
              (local.tee 0
                (i32.load offset=20
                  (local.get 4)))))
          (i32.store offset=20
            (local.get 1)
            (local.get 0))
          (i32.store offset=24
            (local.get 0)
            (local.get 1)))
        (block  
          (if  
            (i32.le_u
              (local.get 2)
              (i32.const 15))
            (then
              (i32.store offset=4
                (local.get 4)
                (i32.or
                  (local.tee 0
                    (i32.add(local.get 2)
                      (local.get 5)))
                  (i32.const 3)))
              (i32.store offset=4
                (local.tee 0
                  (i32.add(local.get 0)
                    (local.get 4)))
                (i32.or
                  (i32.load offset=4
                    (local.get 0))
                  (i32.const 1)))
              (br 1 (;@112;))))
          (i32.store offset=4
            (local.get 4)
            (i32.or
              (local.get 5)
              (i32.const 3)))
          (i32.store offset=4
            (local.tee 3
              (i32.add(local.get 4)
                (local.get 5)))
            (i32.or
              (local.get 2)
              (i32.const 1)))
          (i32.store
            (i32.add(local.get 2)
              (local.get 3))
            (local.get 2))
          (if  
            (i32.le_u
              (local.get 2)
              (i32.const 255))
            (then
              (local.set 0
                (i32.add(i32.shl(local.tee 1
                      (i32.shr_u
                        (local.get 2)
                        (i32.const 3)))
                    (i32.const 3))
                  (i32.const 1692)))
              (local.set 1
                (block (result i32)  
                  (if  
                    (i32.eqz
                      (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 2
                          (i32.load
                            (i32.const 1652))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 1
                          (i32.shl(i32.const 1)
                            (local.get 1))))(i32.const 1)
)))(i32.const 1)
))
                    (then
                      (i32.store
                        (i32.const 1652)
                        (i32.or
                          (local.get 1)
                          (local.get 2)))
                      (br 1 (;@115;)
                        (local.get 0))))
                  (i32.load offset=8
                    (local.get 0))))
              (i32.store offset=8
                (local.get 0)
                (local.get 3))
              (i32.store offset=12
                (local.get 1)
                (local.get 3))
              (i32.store offset=12
                (local.get 3)
                (local.get 0))
              (i32.store offset=8
                (local.get 3)
                (local.get 1))
              (br 1 (;@115;))))
          (i32.store offset=28
            (local.get 3)
            (local.tee 0
              (block (result i32)  
                (drop
                  (br_if 0 (;@117;)
                    (i32.const 0)
                    (i32.eqz
                      (local.tee 0
                        (i32.shr_u
                          (local.get 2)
                          (i32.const 8))))))
                (drop
                  (br_if 0 (;@117;)
                    (i32.const 31)
                    (i32.gt_u
                      (local.get 2)
                      (i32.const 16777215))))
                (i32.add(i32.or
                    (i32.shl(local.tee 0
                        (i32.sub
                          (i32.shr_u
                            (i32.shl(local.tee 5
                                (i32.shl(local.tee 1
                                    (i32.shl(local.get 0)
                                      (local.tee 0
                                        (i32.and(i32.shr_u
                                            (i32.add(local.get 0)
                                              (i32.const 1048320))
                                            (i32.const 16))
                                          (i32.const 8)))))
                                  (local.tee 1
                                    (i32.and(i32.shr_u
                                        (i32.add(local.get 1)
                                          (i32.const 520192))
                                        (i32.const 16))
                                      (i32.const 4)))))
                              (local.tee 5
                                (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                    (i32.add(local.get 5)
                                      (i32.const 245760))
                                    (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 2))(i32.const 1)
)))(i32.const 1)
)))
                            (i32.const 15))
                          (i32.or
                            (i32.or
                              (local.get 0)
                              (local.get 1))
                            (local.get 5))))
                      (i32.const 1))
                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                        (local.get 2)
                        (i32.add(local.get 0)
                          (i32.const 21))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
))
                  (i32.const 28)))))
          (i64.store offset=16 align=4
            (local.get 3)
            (i64.const 0))
          (local.set 1
            (i32.add(i32.shl(local.get 0)
                (i32.const 2))
              (i32.const 1956)))
          (block  
            (block  
              (if  
                (i32.eqz
                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 7))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 5
                      (i32.shl(i32.const 1)
                        (local.get 0))))(i32.const 1)
)))(i32.const 1)
))
                (then
                  (i32.store
                    (i32.const 1656)
                    (i32.or
                      (local.get 5)
                      (local.get 7)))
                  (i32.store
                    (local.get 1)
                    (local.get 3))
                  (br 1 (;@119;))))
              (local.set 0
                (i32.shl(local.get 2)
                  (select
                    (i32.const 0)
                    (i32.sub
                      (i32.const 25)
                      (i32.shr_u
                        (local.get 0)
                        (i32.const 1)))
                    (i32.eq
                      (local.get 0)
                      (i32.const 31)))))
              (local.set 5
                (i32.load
                  (local.get 1)))
              (loop  
                (br_if 2 (;@119;)
                  (i32.eq
                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=4
                        (local.tee 1
                          (local.get 5))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
)
                    (local.get 2)))
                (local.set 5
                  (i32.shr_u
                    (local.get 0)
                    (i32.const 29)))
                (local.set 0
                  (i32.shl(local.get 0)
                    (i32.const 1)))
                (br_if 0 (;@121;)
                  (local.tee 5
                    (i32.load offset=16
                      (local.tee 6
                        (i32.add(local.get 1)
                          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 5))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 4))(i32.const 1)
)))(i32.const 1)
)))))))
              (i32.store offset=16
                (local.get 6)
                (local.get 3)))
            (i32.store offset=24
              (local.get 3)
              (local.get 1))
            (i32.store offset=12
              (local.get 3)
              (local.get 3))
            (i32.store offset=8
              (local.get 3)
              (local.get 3))
            (br 1 (;@120;)))
          (i32.store offset=12
            (local.tee 0
              (i32.load offset=8
                (local.get 1)))
            (local.get 3))
          (i32.store offset=8
            (local.get 1)
            (local.get 3))
          (i32.store offset=24
            (local.get 3)
            (i32.const 0))
          (i32.store offset=12
            (local.get 3)
            (local.get 1))
          (i32.store offset=8
            (local.get 3)
            (local.get 0)))
        (local.set 0
          (i32.add(local.get 4)
            (i32.const 8)))
        (br 1 (;@120;)))
      (block  
        (br_if 0 (;@122;)
          (i32.eqz
            (local.get 9)))
        (block  
          (if  
            (i32.eq
              (i32.load
                (local.tee 2
                  (i32.add(i32.shl(local.tee 0
                        (i32.load offset=28
                          (local.get 1)))
                      (i32.const 2))
                    (i32.const 1956))))
              (local.get 1))
            (then
              (i32.store
                (local.get 2)
                (local.get 4))
              (br_if 1 (;@123;)
                (local.get 4))
              (i32.store
                (i32.const 1656)
                (i32.and(local.get 10)
                  (i32.rotl
                    (i32.const -2)
                    (local.get 0))))
              (br 2 (;@122;))))
          (i32.store
            (i32.add(local.get 9)
              (select
                (i32.const 16)
                (i32.const 20)
                (i32.eq
                  (i32.load offset=16
                    (local.get 9))
                  (local.get 1))))
            (local.get 4))
          (br_if 1 (;@123;)
            (i32.eqz
              (local.get 4))))
        (i32.store offset=24
          (local.get 4)
          (local.get 9))
        (if  
          (local.tee 0
            (i32.load offset=16
              (local.get 1)))
          (then
            (i32.store offset=16
              (local.get 4)
              (local.get 0))
            (i32.store offset=24
              (local.get 0)
              (local.get 4))))
        (br_if 0 (;@125;)
          (i32.eqz
            (local.tee 0
              (i32.load offset=20
                (local.get 1)))))
        (i32.store offset=20
          (local.get 4)
          (local.get 0))
        (i32.store offset=24
          (local.get 0)
          (local.get 4)))
      (block  
        (if  
          (i32.le_u
            (local.get 3)
            (i32.const 15))
          (then
            (i32.store offset=4
              (local.get 1)
              (i32.or
                (local.tee 0
                  (i32.add(local.get 3)
                    (local.get 5)))
                (i32.const 3)))
            (i32.store offset=4
              (local.tee 0
                (i32.add(local.get 0)
                  (local.get 1)))
              (i32.or
                (i32.load offset=4
                  (local.get 0))
                (i32.const 1)))
            (br 1 (;@126;))))
        (i32.store offset=4
          (local.get 1)
          (i32.or
            (local.get 5)
            (i32.const 3)))
        (i32.store offset=4
          (local.tee 4
            (i32.add(local.get 1)
              (local.get 5)))
          (i32.or
            (local.get 3)
            (i32.const 1)))
        (i32.store
          (i32.add(local.get 3)
            (local.get 4))
          (local.get 3))
        (if  
          (local.get 8)
          (then
            (local.set 0
              (i32.add(i32.shl(local.tee 5
                    (i32.shr_u
                      (local.get 8)
                      (i32.const 3)))
                  (i32.const 3))
                (i32.const 1692)))
            (local.set 2
              (i32.load
                (i32.const 1672)))
            (local.set 5
              (block (result i32)  
                (if  
                  (i32.eqz
                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 5
                        (i32.shl(i32.const 1)
                          (local.get 5))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 6))(i32.const 1)
)))(i32.const 1)
))
                  (then
                    (i32.store
                      (i32.const 1652)
                      (i32.or
                        (local.get 5)
                        (local.get 6)))
                    (br 1 (;@129;)
                      (local.get 0))))
                (i32.load offset=8
                  (local.get 0))))
            (i32.store offset=8
              (local.get 0)
              (local.get 2))
            (i32.store offset=12
              (local.get 5)
              (local.get 2))
            (i32.store offset=12
              (local.get 2)
              (local.get 0))
            (i32.store offset=8
              (local.get 2)
              (local.get 5))))
        (i32.store
          (i32.const 1672)
          (local.get 4))
        (i32.store
          (i32.const 1660)
          (local.get 3)))
      (local.set 0
        (i32.add(local.get 1)
          (i32.const 8))))
    (global.set 0
      (i32.add(local.get 11)
        (i32.const 16)))
    (local.get 0))
  (func $dlfree (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    (block  
      (br_if 0 (;@1;)
        (i32.eqz
          (local.get 0)))
      (local.set 5
        (i32.add(local.tee 3
            (i32.add(local.get 0)
              (i32.const -8)))
          (local.tee 0
            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 1
                (i32.load
                  (i32.add(local.get 0)
                    (i32.const -4)))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -8))(i32.const 1)
)))(i32.const 1)
))))
      (block  
        (br_if 0 (;@2;)
          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
))
        (br_if 1 (;@1;)
          (i32.eqz
            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 3))(i32.const 1)
)))(i32.const 1)
)))
        (br_if 1 (;@1;)
          (i32.lt_u
            (local.tee 3
              (i32.sub
                (local.get 3)
                (local.tee 2
                  (i32.load
                    (local.get 3)))))
            (local.tee 4
              (i32.load
                (i32.const 1668)))))
        (local.set 0
          (i32.add(local.get 0)
            (local.get 2)))
        (if  
          (i32.ne
            (local.get 3)
            (i32.load
              (i32.const 1672)))
          (then
            (if  
              (i32.le_u
                (local.get 2)
                (i32.const 255))
              (then
                (drop
                  (i32.ne
                    (local.tee 4
                      (i32.load offset=8
                        (local.get 3)))
                    (i32.add(i32.shl(local.tee 2
                          (i32.shr_u
                            (local.get 2)
                            (i32.const 3)))
                        (i32.const 3))
                      (i32.const 1692))))
                (if  
                  (i32.eq
                    (local.get 4)
                    (local.tee 1
                      (i32.load offset=12
                        (local.get 3))))
                  (then
                    (i32.store
                      (i32.const 1652)
                      (i32.and(i32.load
                          (i32.const 1652))
                        (i32.rotl
                          (i32.const -2)
                          (local.get 2))))
                    (br 3 (;@2;))))
                (i32.store offset=12
                  (local.get 4)
                  (local.get 1))
                (i32.store offset=8
                  (local.get 1)
                  (local.get 4))
                (br 2 (;@3;))))
            (local.set 6
              (i32.load offset=24
                (local.get 3)))
            (block  
              (if  
                (i32.ne
                  (local.get 3)
                  (local.tee 1
                    (i32.load offset=12
                      (local.get 3))))
                (then
                  (if  
                    (i32.le_u
                      (local.get 4)
                      (local.tee 2
                        (i32.load offset=8
                          (local.get 3))))
                    (then
                      (drop
                        (i32.load offset=12
                          (local.get 2)))))
                  (i32.store offset=12
                    (local.get 2)
                    (local.get 1))
                  (i32.store offset=8
                    (local.get 1)
                    (local.get 2))
                  (br 1 (;@7;))))
              (block  
                (br_if 0 (;@9;)
                  (local.tee 4
                    (i32.load
                      (local.tee 2
                        (i32.add(local.get 3)
                          (i32.const 20))))))
                (br_if 0 (;@9;)
                  (local.tee 4
                    (i32.load
                      (local.tee 2
                        (i32.add(local.get 3)
                          (i32.const 16))))))
                (local.set 1
                  (i32.const 0))
                (br 1 (;@8;)))
              (loop  
                (local.set 7
                  (local.get 2))
                (br_if 0 (;@10;)
                  (local.tee 4
                    (i32.load
                      (local.tee 2
                        (i32.add(local.tee 1
                            (local.get 4))
                          (i32.const 20))))))
                (local.set 2
                  (i32.add(local.get 1)
                    (i32.const 16)))
                (br_if 0 (;@10;)
                  (local.tee 4
                    (i32.load offset=16
                      (local.get 1)))))
              (i32.store
                (local.get 7)
                (i32.const 0)))
            (br_if 1 (;@9;)
              (i32.eqz
                (local.get 6)))
            (block  
              (if  
                (i32.eq
                  (local.get 3)
                  (i32.load
                    (local.tee 4
                      (i32.add(i32.shl(local.tee 2
                            (i32.load offset=28
                              (local.get 3)))
                          (i32.const 2))
                        (i32.const 1956)))))
                (then
                  (i32.store
                    (local.get 4)
                    (local.get 1))
                  (br_if 1 (;@11;)
                    (local.get 1))
                  (i32.store
                    (i32.const 1656)
                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                        (i32.const 1656)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                        (i32.const -2)
                        (local.get 2)))(i32.const 1)
)))(i32.const 1)
))
                  (br 3 (;@9;))))
              (i32.store
                (i32.add(local.get 6)
                  (select
                    (i32.const 16)
                    (i32.const 20)
                    (i32.eq
                      (i32.load offset=16
                        (local.get 6))
                      (local.get 3))))
                (local.get 1))
              (br_if 2 (;@10;)
                (i32.eqz
                  (local.get 1))))
            (i32.store offset=24
              (local.get 1)
              (local.get 6))
            (if  
              (local.tee 2
                (i32.load offset=16
                  (local.get 3)))
              (then
                (i32.store offset=16
                  (local.get 1)
                  (local.get 2))
                (i32.store offset=24
                  (local.get 2)
                  (local.get 1))))
            (br_if 1 (;@12;)
              (i32.eqz
                (local.tee 2
                  (i32.load offset=20
                    (local.get 3)))))
            (i32.store offset=20
              (local.get 1)
              (local.get 2))
            (i32.store offset=24
              (local.get 2)
              (local.get 1))
            (br 1 (;@12;))))
        (br_if 0 (;@13;)
          (i32.ne
            (i32.and(local.tee 1
                (i32.load offset=4
                  (local.get 5)))
              (i32.const 3))
            (i32.const 3)))
        (i32.store
          (i32.const 1660)
          (local.get 0))
        (i32.store offset=4
          (local.get 5)
          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.get 1))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -2))(i32.const 1)
)))(i32.const 1)
))
        (i32.store offset=4
          (local.get 3)
          (i32.or
            (local.get 0)
            (i32.const 1)))
        (i32.store
          (i32.add(local.get 0)
            (local.get 3))
          (local.get 0))
        (return))
      (br_if 0 (;@13;)
        (i32.le_u
          (local.get 5)
          (local.get 3)))
      (br_if 0 (;@13;)
        (i32.eqz
          (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 1
              (i32.load offset=4
                (local.get 5))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
)))
      (block  
        (if  
          (i32.eqz
            (i32.and(local.get 1)
              (i32.const 2)))
          (then
            (if  
              (i32.eq
                (local.get 5)
                (i32.load
                  (i32.const 1676)))
              (then
                (i32.store
                  (i32.const 1676)
                  (local.get 3))
                (i32.store
                  (i32.const 1664)
                  (local.tee 0
                    (i32.add(i32.load
                        (i32.const 1664))
                      (local.get 0))))
                (i32.store offset=4
                  (local.get 3)
                  (i32.or
                    (local.get 0)
                    (i32.const 1)))
                (br_if 3 (;@13;)
                  (i32.ne
                    (local.get 3)
                    (i32.load
                      (i32.const 1672))))
                (i32.store
                  (i32.const 1660)
                  (i32.const 0))
                (i32.store
                  (i32.const 1672)
                  (i32.const 0))
                (return)))
            (if  
              (i32.eq
                (local.get 5)
                (i32.load
                  (i32.const 1672)))
              (then
                (i32.store
                  (i32.const 1672)
                  (local.get 3))
                (i32.store
                  (i32.const 1660)
                  (local.tee 0
                    (i32.add(i32.load
                        (i32.const 1660))
                      (local.get 0))))
                (i32.store offset=4
                  (local.get 3)
                  (i32.or
                    (local.get 0)
                    (i32.const 1)))
                (i32.store
                  (i32.add(local.get 0)
                    (local.get 3))
                  (local.get 0))
                (return)))
            (local.set 0
              (i32.add(i32.and(local.get 1)
                  (i32.const -8))
                (local.get 0)))
            (block  
              (if  
                (i32.le_u
                  (local.get 1)
                  (i32.const 255))
                (then
                  (local.set 2
                    (i32.load offset=12
                      (local.get 5)))
                  (if  
                    (i32.ne
                      (local.tee 4
                        (i32.load offset=8
                          (local.get 5)))
                      (local.tee 7
                        (i32.add(i32.shl(local.tee 1
                              (i32.shr_u
                                (local.get 1)
                                (i32.const 3)))
                            (i32.const 3))
                          (i32.const 1692))))
                    (then
                      (drop
                        (i32.load
                          (i32.const 1668)))))
                  (if  
                    (i32.eq
                      (local.get 2)
                      (local.get 4))
                    (then
                      (i32.store
                        (i32.const 1652)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                            (i32.const 1652)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                            (i32.const -2)
                            (local.get 1)))(i32.const 1)
)))(i32.const 1)
))
                      (br 2 (;@19;))))
                  (if  
                    (i32.ne
                      (local.get 2)
                      (local.get 7))
                    (then
                      (drop
                        (i32.load
                          (i32.const 1668)))))
                  (i32.store offset=12
                    (local.get 4)
                    (local.get 2))
                  (i32.store offset=8
                    (local.get 2)
                    (local.get 4))
                  (br 1 (;@21;))))
              (local.set 6
                (i32.load offset=24
                  (local.get 5)))
              (block  
                (if  
                  (i32.ne
                    (local.get 5)
                    (local.tee 1
                      (i32.load offset=12
                        (local.get 5))))
                  (then
                    (if  
                      (i32.le_u
                        (i32.load
                          (i32.const 1668))
                        (local.tee 2
                          (i32.load offset=8
                            (local.get 5))))
                      (then
                        (drop
                          (i32.load offset=12
                            (local.get 2)))))
                    (i32.store offset=12
                      (local.get 2)
                      (local.get 1))
                    (i32.store offset=8
                      (local.get 1)
                      (local.get 2))
                    (br 1 (;@24;))))
                (block  
                  (br_if 0 (;@26;)
                    (local.tee 4
                      (i32.load
                        (local.tee 2
                          (i32.add(local.get 5)
                            (i32.const 20))))))
                  (br_if 0 (;@26;)
                    (local.tee 4
                      (i32.load
                        (local.tee 2
                          (i32.add(local.get 5)
                            (i32.const 16))))))
                  (local.set 1
                    (i32.const 0))
                  (br 1 (;@25;)))
                (loop  
                  (local.set 7
                    (local.get 2))
                  (br_if 0 (;@27;)
                    (local.tee 4
                      (i32.load
                        (local.tee 2
                          (i32.add(local.tee 1
                              (local.get 4))
                            (i32.const 20))))))
                  (local.set 2
                    (i32.add(local.get 1)
                      (i32.const 16)))
                  (br_if 0 (;@27;)
                    (local.tee 4
                      (i32.load offset=16
                        (local.get 1)))))
                (i32.store
                  (local.get 7)
                  (i32.const 0)))
              (br_if 0 (;@27;)
                (i32.eqz
                  (local.get 6)))
              (block  
                (if  
                  (i32.eq
                    (local.get 5)
                    (i32.load
                      (local.tee 4
                        (i32.add(i32.shl(local.tee 2
                              (i32.load offset=28
                                (local.get 5)))
                            (i32.const 2))
                          (i32.const 1956)))))
                  (then
                    (i32.store
                      (local.get 4)
                      (local.get 1))
                    (br_if 1 (;@28;)
                      (local.get 1))
                    (i32.store
                      (i32.const 1656)
                      (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                          (i32.const 1656)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.rotl
                          (i32.const -2)
                          (local.get 2)))(i32.const 1)
)))(i32.const 1)
))
                    (br 2 (;@27;))))
                (i32.store
                  (i32.add(local.get 6)
                    (select
                      (i32.const 16)
                      (i32.const 20)
                      (i32.eq
                        (i32.load offset=16
                          (local.get 6))
                        (local.get 5))))
                  (local.get 1))
                (br_if 1 (;@28;)
                  (i32.eqz
                    (local.get 1))))
              (i32.store offset=24
                (local.get 1)
                (local.get 6))
              (if  
                (local.tee 2
                  (i32.load offset=16
                    (local.get 5)))
                (then
                  (i32.store offset=16
                    (local.get 1)
                    (local.get 2))
                  (i32.store offset=24
                    (local.get 2)
                    (local.get 1))))
              (br_if 0 (;@30;)
                (i32.eqz
                  (local.tee 2
                    (i32.load offset=20
                      (local.get 5)))))
              (i32.store offset=20
                (local.get 1)
                (local.get 2))
              (i32.store offset=24
                (local.get 2)
                (local.get 1)))
            (i32.store offset=4
              (local.get 3)
              (i32.or
                (local.get 0)
                (i32.const 1)))
            (i32.store
              (i32.add(local.get 0)
                (local.get 3))
              (local.get 0))
            (br_if 1 (;@29;)
              (i32.ne
                (local.get 3)
                (i32.load
                  (i32.const 1672))))
            (i32.store
              (i32.const 1660)
              (local.get 0))
            (return)))
        (i32.store offset=4
          (local.get 5)
          (i32.and(local.get 1)
            (i32.const -2)))
        (i32.store offset=4
          (local.get 3)
          (i32.or
            (local.get 0)
            (i32.const 1)))
        (i32.store
          (i32.add(local.get 0)
            (local.get 3))
          (local.get 0)))
      (if  
        (i32.le_u
          (local.get 0)
          (i32.const 255))
        (then
          (local.set 0
            (i32.add(i32.shl(local.tee 1
                  (i32.shr_u
                    (local.get 0)
                    (i32.const 3)))
                (i32.const 3))
              (i32.const 1692)))
          (local.set 2
            (block (result i32)  
              (if  
                (i32.eqz
                  (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 2
                      (i32.load
                        (i32.const 1652))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(local.tee 1
                      (i32.shl(i32.const 1)
                        (local.get 1))))(i32.const 1)
)))(i32.const 1)
))
                (then
                  (i32.store
                    (i32.const 1652)
                    (i32.or
                      (local.get 1)
                      (local.get 2)))
                  (br 1 (;@32;)
                    (local.get 0))))
              (i32.load offset=8
                (local.get 0))))
          (i32.store offset=8
            (local.get 0)
            (local.get 3))
          (i32.store offset=12
            (local.get 2)
            (local.get 3))
          (i32.store offset=12
            (local.get 3)
            (local.get 0))
          (i32.store offset=8
            (local.get 3)
            (local.get 2))
          (return)))
      (i64.store offset=16 align=4
        (local.get 3)
        (i64.const 0))
      (i32.store offset=28
        (local.get 3)
        (local.tee 2
          (block (result i32)  
            (drop
              (br_if 0 (;@34;)
                (i32.const 0)
                (i32.eqz
                  (local.tee 1
                    (i32.shr_u
                      (local.get 0)
                      (i32.const 8))))))
            (drop
              (br_if 0 (;@34;)
                (i32.const 31)
                (i32.gt_u
                  (local.get 0)
                  (i32.const 16777215))))
            (i32.add(i32.or
                (i32.shl(local.tee 1
                    (i32.sub
                      (i32.shr_u
                        (i32.shl(local.tee 4
                            (i32.shl(local.tee 2
                                (i32.shl(local.get 1)
                                  (local.tee 1
                                    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                        (i32.add(local.get 1)
                                          (i32.const 1048320))
                                        (i32.const 16)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 8))(i32.const 1)
)))(i32.const 1)
))))
                              (local.tee 2
                                (i32.and(i32.shr_u
                                    (i32.add(local.get 2)
                                      (i32.const 520192))
                                    (i32.const 16))
                                  (i32.const 4)))))
                          (local.tee 4
                            (i32.and(i32.shr_u
                                (i32.add(local.get 4)
                                  (i32.const 245760))
                                (i32.const 16))
                              (i32.const 2))))
                        (i32.const 15))
                      (i32.or
                        (i32.or
                          (local.get 1)
                          (local.get 2))
                        (local.get 4))))
                  (i32.const 1))
                (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                    (local.get 0)
                    (i32.add(local.get 1)
                      (i32.const 21))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
))
              (i32.const 28)))))
      (local.set 1
        (i32.add(i32.shl(local.get 2)
            (i32.const 2))
          (i32.const 1956)))
      (block  
        (block  
          (block  
            (if  
              (i32.eqz
                (i32.and(local.tee 4
                    (i32.load
                      (i32.const 1656)))
                  (local.tee 7
                    (i32.shl(i32.const 1)
                      (local.get 2)))))
              (then
                (i32.store
                  (i32.const 1656)
                  (i32.or
                    (local.get 4)
                    (local.get 7)))
                (i32.store
                  (local.get 1)
                  (local.get 3))
                (i32.store offset=24
                  (local.get 3)
                  (local.get 1))
                (br 1 (;@37;))))
            (local.set 2
              (i32.shl(local.get 0)
                (select
                  (i32.const 0)
                  (i32.sub
                    (i32.const 25)
                    (i32.shr_u
                      (local.get 2)
                      (i32.const 1)))
                  (i32.eq
                    (local.get 2)
                    (i32.const 31)))))
            (local.set 1
              (i32.load
                (local.get 1)))
            (loop  
              (br_if 2 (;@37;)
                (i32.eq
                  (i32.and(i32.load offset=4
                      (local.tee 4
                        (local.get 1)))
                    (i32.const -8))
                  (local.get 0)))
              (local.set 1
                (i32.shr_u
                  (local.get 2)
                  (i32.const 29)))
              (local.set 2
                (i32.shl(local.get 2)
                  (i32.const 1)))
              (br_if 0 (;@39;)
                (local.tee 1
                  (i32.load
                    (i32.add(local.tee 7
                        (i32.add(local.get 4)
                          (i32.and(local.get 1)
                            (i32.const 4))))
                      (i32.const 16))))))
            (i32.store offset=16
              (local.get 7)
              (local.get 3))
            (i32.store offset=24
              (local.get 3)
              (local.get 4)))
          (i32.store offset=12
            (local.get 3)
            (local.get 3))
          (i32.store offset=8
            (local.get 3)
            (local.get 3))
          (br 1 (;@38;)))
        (i32.store offset=12
          (local.tee 0
            (i32.load offset=8
              (local.get 4)))
          (local.get 3))
        (i32.store offset=8
          (local.get 4)
          (local.get 3))
        (i32.store offset=24
          (local.get 3)
          (i32.const 0))
        (i32.store offset=12
          (local.get 3)
          (local.get 4))
        (i32.store offset=8
          (local.get 3)
          (local.get 0)))
      (i32.store
        (i32.const 1684)
        (local.tee 0
          (i32.add(i32.load
              (i32.const 1684))
            (i32.const -1))))
      (br_if 0 (;@39;)
        (local.get 0))
      (local.set 3
        (i32.const 2108))
      (loop  
        (local.set 3
          (i32.add(local.tee 0
              (i32.load
                (local.get 3)))
            (i32.const 8)))
        (br_if 0 (;@40;)
          (local.get 0)))
      (i32.store
        (i32.const 1684)
        (i32.const -1))))
  (func $blake2b_init_param (type 2) (param i32 i32)
    (local i32 i64)
    (global.set 0
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 2)
      (local.get 0))
    (i32.store offset=8
      (local.get 2)
      (local.get 1))
    (i32.store offset=4
      (local.get 2)
      (i32.load offset=8
        (local.get 2)))
    (call $memset
      (i32.load offset=12
        (local.get 2))
      (i32.const 200))
    (i32.store
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load
            (local.get 2))
          (i32.const 8))
        (then
          (local.set 0
            (i32.load
              (local.get 2)))
          (local.set 3
            (call $load64
              (i32.add(i32.load offset=4
                  (local.get 2))
                (i32.shl(i32.load
                    (local.get 2))
                  (i32.const 3)))))
          (i64.store
            (i32.add(i32.load offset=12
                (local.get 2))
              (i32.shl(i32.load
                  (local.get 2))
                (i32.const 3)))
            (i64.xor
              (local.get 3)
              (i64.load
                (i32.add(i32.shl(local.get 0)
                    (i32.const 3))
                  (i32.const 1024)))))
          (i32.store
            (local.get 2)
            (i32.add(i32.load
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (global.set 0
      (i32.add(local.get 2)
        (i32.const 16))))
  (func $load64 (type 9) (param i32) (result i64)
    (local i32)
    (i32.store offset=12
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 16)))
      (local.get 0))
    (i32.store offset=8
      (local.get 1)
      (i32.load offset=12
        (local.get 1)))
    (i64.or
      (i64.or
        (i64.or
          (i64.or
            (i64.or
              (i64.or
                (i64.or
                  (i64.extend_i32_u
                    (i32.load8_u
                      (i32.load offset=8
                        (local.get 1))))
                  (i64.shl
                    (i64.extend_i32_u
                      (i32.load8_u offset=1
                        (i32.load offset=8
                          (local.get 1))))
                    (i64.const 8)))
                (i64.shl
                  (i64.extend_i32_u
                    (i32.load8_u offset=2
                      (i32.load offset=8
                        (local.get 1))))
                  (i64.const 16)))
              (i64.shl
                (i64.extend_i32_u
                  (i32.load8_u offset=3
                    (i32.load offset=8
                      (local.get 1))))
                (i64.const 24)))
            (i64.shl
              (i64.extend_i32_u
                (i32.load8_u offset=4
                  (i32.load offset=8
                    (local.get 1))))
              (i64.const 32)))
          (i64.shl
            (i64.extend_i32_u
              (i32.load8_u offset=5
                (i32.load offset=8
                  (local.get 1))))
            (i64.const 40)))
        (i64.shl
          (i64.extend_i32_u
            (i32.load8_u offset=6
              (i32.load offset=8
                (local.get 1))))
          (i64.const 48)))
      (i64.shl
        (i64.extend_i32_u
          (i32.load8_u offset=7
            (i32.load offset=8
              (local.get 1))))
        (i64.const 56))))
  (func $rotr64 (type 10) (param i64 i32) (result i64)
    (local i32)
    (i64.store offset=8
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 16)))
      (local.get 0))
    (i32.store offset=4
      (local.get 2)
      (local.get 1))
    (i64.or
      (i64.shl
        (i64.load offset=8
          (local.get 2))
        (i64.extend_i32_u
          (i32.sub
            (i32.const 64)
            (i32.load offset=4
              (local.get 2)))))
      (i64.shr_u
        (i64.load offset=8
          (local.get 2))
        (i64.extend_i32_u
          (i32.load offset=4
            (local.get 2))))))
  (func $blake2b_update (type 4) (param i32 i32 i32)
    (local i32)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 32))))
    (i32.store offset=28
      (local.get 3)
      (local.get 0))
    (i32.store offset=24
      (local.get 3)
      (local.get 1))
    (i32.store16 offset=22
      (local.get 3)
      (local.get 2))
    (if  
      (i32.gt_s
        (i32.load16_u offset=22
          (local.get 3))
        (i32.const 0))
      (then
        (i32.store offset=16
          (local.get 3)
          (i32.load8_u offset=194
            (i32.load offset=28
              (local.get 3))))
        (i32.store offset=12
          (local.get 3)
          (i32.sub
            (i32.const 128)
            (i32.load offset=16
              (local.get 3))))
        (if  
          (i32.gt_u
            (i32.load16_u offset=22
              (local.get 3))
            (i32.load offset=12
              (local.get 3)))
          (then
            (i32.store8 offset=194
              (i32.load offset=28
                (local.get 3))
              (i32.const 0))
            (drop
              (call $memcpy
                (i32.add(i32.load offset=16
                    (local.get 3))
                  (i32.sub
                    (i32.load offset=28
                      (local.get 3))
                    (i32.const -64)))
                (i32.load offset=24
                  (local.get 3))
                (i32.load offset=12
                  (local.get 3))))
            (i32.store16 offset=192
              (local.tee 0
                (i32.load offset=28
                  (local.get 3)))
              (i32.add(i32.load16_u offset=192
                  (local.get 0))
                (i32.const 128)))
            (call $blake2b_compress
              (i32.load offset=28
                (local.get 3))
              (i32.sub
                (i32.load offset=28
                  (local.get 3))
                (i32.const -64)))
            (i32.store offset=24
              (local.get 3)
              (i32.add(i32.load offset=24
                  (local.get 3))
                (i32.load offset=12
                  (local.get 3))))
            (i32.store16 offset=22
              (local.get 3)
              (i32.sub
                (i32.load16_u offset=22
                  (local.get 3))
                (i32.load offset=12
                  (local.get 3))))
            (loop  
              (if  
                (i32.gt_s
                  (i32.load16_u offset=22
                    (local.get 3))
                  (i32.const 128))
                (then
                  (i32.store16 offset=192
                    (local.tee 0
                      (i32.load offset=28
                        (local.get 3)))
                    (i32.add(i32.load16_u offset=192
                        (local.get 0))
                      (i32.const 128)))
                  (call $blake2b_compress
                    (i32.load offset=28
                      (local.get 3))
                    (i32.load offset=24
                      (local.get 3)))
                  (i32.store offset=24
                    (local.get 3)
                    (i32.add(i32.load offset=24
                        (local.get 3))
                      (i32.const 128)))
                  (i32.store16 offset=22
                    (local.get 3)
                    (i32.add(i32.load16_u offset=22
                        (local.get 3))
                      (i32.const -128)))
                  (br 1 (;@3;)))))))
        (drop
          (call $memcpy
            (i32.add(i32.load8_u offset=194
                (i32.load offset=28
                  (local.get 3)))
              (i32.sub
                (i32.load offset=28
                  (local.get 3))
                (i32.const -64)))
            (i32.load offset=24
              (local.get 3))
            (i32.load16_u offset=22
              (local.get 3))))
        (i32.store8 offset=194
          (local.tee 0
            (i32.load offset=28
              (local.get 3)))
          (i32.add(i32.load8_u offset=194
              (local.get 0))
            (i32.load16_u offset=22
              (local.get 3))))))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 32))))
  (func $blake2b_compress (type 2) (param i32 i32)
    (local i32 i64)
    (global.set 0
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 288))))
    (i32.store offset=284
      (local.get 2)
      (local.get 0))
    (i32.store offset=280
      (local.get 2)
      (local.get 1))
    (i32.store offset=12
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=12
            (local.get 2))
          (i32.const 16))
        (then
          (local.set 3
            (call $load64
              (i32.add(i32.load offset=280
                  (local.get 2))
                (i32.shl(i32.load offset=12
                    (local.get 2))
                  (i32.const 3)))))
          (i64.store
            (i32.add(i32.add(local.get 2)
                (i32.const 144))
              (i32.shl(i32.load offset=12
                  (local.get 2))
                (i32.const 3)))
            (local.get 3))
          (i32.store offset=12
            (local.get 2)
            (i32.add(i32.load offset=12
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (i32.store offset=12
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.eqz
          (i32.ge_s
            (i32.load offset=12
              (local.get 2))
            (i32.const 8)))
        (then
          (i64.store
            (i32.add(i32.add(local.get 2)
                (i32.const 16))
              (i32.shl(i32.load offset=12
                  (local.get 2))
                (i32.const 3)))
            (i64.load
              (i32.add(i32.load offset=284
                  (local.get 2))
                (i32.shl(i32.load offset=12
                    (local.get 2))
                  (i32.const 3)))))
          (i32.store offset=12
            (local.get 2)
            (i32.add(i32.load offset=12
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@3;)))))
    (i64.store offset=80
      (local.get 2)
      (i64.const 7640891576956012808))
    (i64.store offset=88
      (local.get 2)
      (i64.const -4942790177534073029))
    (i64.store offset=96
      (local.get 2)
      (i64.const 4354685564936845355))
    (i64.store offset=104
      (local.get 2)
      (i64.const -6534734903238641935))
    (i64.store offset=112
      (local.get 2)
      (i64.xor
        (i64.extend_i32_u
          (i32.load16_u offset=192
            (i32.load offset=284
              (local.get 2))))
        (i64.const 5840696475078001361)))
    (i64.store offset=120
      (local.get 2)
      (i64.const -7276294671716946913))
    (i64.store offset=128
      (local.get 2)
      (i64.xor
        (select
          (i64.const -1)
          (i64.const 0)
          (i32.load8_u offset=195
            (i32.load offset=284
              (local.get 2))))
        (i64.const 2270897969802886507)))
    (i64.store offset=136
      (local.get 2)
      (i64.const 6620516959819538809))
    (i32.store offset=12
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=12
            (local.get 2))
          (i32.const 12))
        (then
          (call $round
            (i32.load offset=12
              (local.get 2))
            (i32.add(local.get 2)
              (i32.const 16))
            (i32.add(local.get 2)
              (i32.const 144)))
          (i32.store offset=12
            (local.get 2)
            (i32.add(i32.load offset=12
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@5;)))))
    (i32.store offset=12
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.eqz
          (i32.ge_s
            (i32.load offset=12
              (local.get 2))
            (i32.const 8)))
        (then
          (i64.store
            (i32.add(i32.load offset=284
                (local.get 2))
              (i32.shl(i32.load offset=12
                  (local.get 2))
                (i32.const 3)))
            (i64.xor
              (i64.xor
                (i64.load
                  (i32.add(i32.load offset=284
                      (local.get 2))
                    (i32.shl(i32.load offset=12
                        (local.get 2))
                      (i32.const 3))))
                (i64.load
                  (i32.add(local.tee 0
                      (i32.add(local.get 2)
                        (i32.const 16)))
                    (i32.shl(i32.load offset=12
                        (local.get 2))
                      (i32.const 3)))))
              (i64.load
                (i32.add(local.get 0)
                  (i32.shl(i32.add(i32.load offset=12
                        (local.get 2))
                      (i32.const 8))
                    (i32.const 3))))))
          (i32.store offset=12
            (local.get 2)
            (i32.add(i32.load offset=12
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@7;)))))
    (global.set 0
      (i32.add(local.get 2)
        (i32.const 288))))
  (func $round (type 4) (param i32 i32 i32)
    (local i32 i64)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 3)
      (local.get 0))
    (i32.store offset=8
      (local.get 3)
      (local.get 1))
    (i32.store offset=4
      (local.get 3)
      (local.get 2))
    (i64.store
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=96
            (i32.load offset=8
              (local.get 3)))
          (i64.load
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=96
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=64
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=64
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=96
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=64
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=32
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=1
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=96
            (i32.load offset=8
              (local.get 3)))
          (i64.load
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=96
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=64
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=64
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=96
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=64
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=32
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=8
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=2
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=104
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=104
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=72
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=72
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=104
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=72
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=40
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=8
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=3
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=104
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=104
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=72
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=72
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=104
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=72
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=40
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=16
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=4
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=112
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=112
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=80
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=80
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=112
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=80
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=48
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=16
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=5
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=112
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=112
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=80
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=80
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=112
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=80
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=48
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=24
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=6
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=120
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=120
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=88
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=88
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=120
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=88
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=56
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=24
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=7
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=120
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=120
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=88
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=88
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=120
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=88
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=56
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=8
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=120
            (i32.load offset=8
              (local.get 3)))
          (i64.load
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=120
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=80
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=80
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=120
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=80
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=40
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=9
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=120
            (i32.load offset=8
              (local.get 3)))
          (i64.load
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=120
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=80
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=80
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=120
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=40
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=80
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=40
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=8
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=10
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=96
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=96
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=88
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=88
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=96
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=88
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=48
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=8
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=11
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=96
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=8
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=96
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=88
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=88
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=96
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=48
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=88
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=48
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=16
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=12
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=104
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=104
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=64
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=64
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=104
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=64
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=56
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=16
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=13
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=104
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=16
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=104
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=64
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=64
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=104
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=56
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=64
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=56
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=24
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=14
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=112
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3))))
        (i32.const 32)))
    (i64.store offset=112
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=72
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=72
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=112
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=72
            (i32.load offset=8
              (local.get 3))))
        (i32.const 24)))
    (i64.store offset=32
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=24
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load
          (i32.add(i32.load offset=4
              (local.get 3))
            (i32.shl(i32.load8_u offset=15
                (i32.add(i32.shl(i32.load offset=12
                      (local.get 3))
                    (i32.const 4))
                  (i32.const 1088)))
              (i32.const 3))))
        (i64.add
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3))))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=112
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=24
            (i32.load offset=8
              (local.get 3))))
        (i32.const 16)))
    (i64.store offset=112
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (i64.store offset=72
      (i32.load offset=8
        (local.get 3))
      (i64.add
        (i64.load offset=72
          (i32.load offset=8
            (local.get 3)))
        (i64.load offset=112
          (i32.load offset=8
            (local.get 3)))))
    (local.set 4
      (call $rotr64
        (i64.xor
          (i64.load offset=32
            (i32.load offset=8
              (local.get 3)))
          (i64.load offset=72
            (i32.load offset=8
              (local.get 3))))
        (i32.const 63)))
    (i64.store offset=32
      (i32.load offset=8
        (local.get 3))
      (local.get 4))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 16))))
  (func $blake2b_final (type 2) (param i32 i32)
    (local i32)
    (global.set 0
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 96))))
    (i32.store offset=88
      (local.get 2)
      (local.get 0))
    (i32.store offset=84
      (local.get 2)
      (local.get 1))
    (i32.store8 offset=83
      (local.get 2)
      (i32.const 50))
    (i64.store
      (local.tee 0
        (i32.add(local.get 2)
          (i32.const 16)))
      (i64.const 0))
    (i64.store offset=56
      (local.get 0)
      (i64.const 0))
    (i64.store offset=48
      (local.get 0)
      (i64.const 0))
    (i64.store offset=40
      (local.get 0)
      (i64.const 0))
    (i64.store offset=32
      (local.get 0)
      (i64.const 0))
    (i64.store offset=24
      (local.get 0)
      (i64.const 0))
    (i64.store offset=16
      (local.get 0)
      (i64.const 0))
    (i64.store offset=8
      (local.get 0)
      (i64.const 0))
    (block  
      (block  
        (if  
          (i32.le_s
            (i32.load8_u offset=83
              (local.get 2))
            (i32.const 64))
          (then
            (br_if 1 (;@2;)
              (i32.eqz
                (i32.load8_u offset=195
                  (i32.load offset=88
                    (local.get 2)))))))
        (i32.store offset=92
          (local.get 2)
          (i32.const -1))
        (br 1 (;@2;)))
      (i32.store16 offset=192
        (local.tee 0
          (i32.load offset=88
            (local.get 2)))
        (i32.add(i32.load16_u offset=192
            (local.get 0))
          (i32.load8_u offset=194
            (i32.load offset=88
              (local.get 2)))))
      (i32.store8 offset=195
        (i32.load offset=88
          (local.get 2))
        (i32.const 1))
      (call $memset
        (i32.add(i32.load8_u offset=194
            (i32.load offset=88
              (local.get 2)))
          (i32.sub
            (i32.load offset=88
              (local.get 2))
            (i32.const -64)))
        (i32.sub
          (i32.const 128)
          (i32.load8_u offset=194
            (i32.load offset=88
              (local.get 2)))))
      (call $blake2b_compress
        (i32.load offset=88
          (local.get 2))
        (i32.sub
          (i32.load offset=88
            (local.get 2))
          (i32.const -64)))
      (i32.store offset=12
        (local.get 2)
        (i32.const 0))
      (loop  
        (if  
          (i32.lt_s
            (i32.load offset=12
              (local.get 2))
            (i32.const 8))
          (then
            (call $store64
              (i32.add(i32.add(local.get 2)
                  (i32.const 16))
                (i32.shl(i32.load offset=12
                    (local.get 2))
                  (i32.const 3)))
              (i64.load
                (i32.add(i32.load offset=88
                    (local.get 2))
                  (i32.shl(i32.load offset=12
                      (local.get 2))
                    (i32.const 3)))))
            (i32.store offset=12
              (local.get 2)
              (i32.add(i32.load offset=12
                  (local.get 2))
                (i32.const 1)))
            (br 1 (;@4;)))))
      (drop
        (call $memcpy
          (i32.load offset=84
            (local.get 2))
          (i32.add(local.get 2)
            (i32.const 16))
          (i32.load8_u offset=83
            (local.get 2))))
      (i32.store offset=92
        (local.get 2)
        (i32.const 0)))
    (global.set 0
      (i32.add(local.get 2)
        (i32.const 96))))
  (func $store64 (type 8) (param i32 i64)
    (local i32)
    (i32.store offset=28
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 32)))
      (local.get 0))
    (i64.store offset=16
      (local.get 2)
      (local.get 1))
    (i32.store offset=12
      (local.get 2)
      (i32.load offset=28
        (local.get 2)))
    (i64.store8
      (i32.load offset=12
        (local.get 2))
      (i64.load offset=16
        (local.get 2)))
    (i64.store8 offset=1
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 8)))
    (i64.store8 offset=2
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 16)))
    (i64.store8 offset=3
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 24)))
    (i64.store8 offset=4
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 32)))
    (i64.store8 offset=5
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 40)))
    (i64.store8 offset=6
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 48)))
    (i64.store8 offset=7
      (i32.load offset=12
        (local.get 2))
      (i64.shr_u
        (i64.load offset=16
          (local.get 2))
        (i64.const 56))))
  (func $step0 (type 0)
    (local i32 i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 544))))
    (i32.store offset=540
      (local.get 0)
      (i32.const 205555816))
    (i32.store
      (i32.const 2148)
      (i32.load offset=540
        (local.get 0)))
    (call $memset
      (local.tee 1
        (i32.add(local.get 0)
          (i32.const 264)))
      (i32.const 64))
    (drop
      (call $memcpy
        (i32.add(local.get 1)
          (i32.const 48))
        (i32.const 1280)
        (i32.const 8)))
    (i32.store8 offset=320
      (local.get 0)
      (i32.const 200))
    (i32.store8 offset=324
      (local.get 0)
      (i32.const 9))
    (i32.store8 offset=264
      (local.get 0)
      (i32.const 50))
    (i32.store8 offset=266
      (local.get 0)
      (i32.const 1))
    (i32.store8 offset=267
      (local.get 0)
      (i32.const 1))
    (call $blake2b_init_param
      (local.tee 2
        (i32.add(local.get 0)
          (i32.const 328)))
      (local.get 1))
    (call $blake2b_update
      (local.get 2)
      (i32.load
        (i32.const 2148))
      (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.sub
          (i32.add(i32.load
              (i32.const 2148))
            (i32.const 140))
          (i32.load
            (i32.const 2148))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 65535))(i32.const 1)
)))(i32.const 1)
))
    (call $l1_init
      (i32.const 2152))
    (i32.store offset=536
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=536
            (local.get 0))
          (i32.const 1048576))
        (then
          (call $blake2b_update
            (local.tee 1
              (call $memcpy
                (i32.add(local.get 0)
                  (i32.const 8))
                (i32.add(local.get 0)
                  (i32.const 328))
                (i32.const 200)))
            (i32.add(local.get 0)
              (i32.const 536))
            (i32.const 4))
          (call $blake2b_final
            (local.get 1)
            (i32.add(local.get 0)
              (i32.const 208)))
          (i32.store offset=532
            (local.get 0)
            (i32.const 0))
          (loop  
            (if  
              (i32.lt_s
                (i32.load offset=532
                  (local.get 0))
                (i32.const 2))
              (then
                (call $step0_add
                  (i32.add(i32.load offset=532
                      (local.get 0))
                    (i32.shl(i32.load offset=536
                        (local.get 0))
                      (i32.const 1)))
                  (i32.add(i32.add(local.get 0)
                      (i32.const 208))
                    (i32.mul(i32.load offset=532
                        (local.get 0))
                      (i32.const 25))))
                (i32.store offset=532
                  (local.get 0)
                  (i32.add(i32.load offset=532
                      (local.get 0))
                    (i32.const 1)))
                (br 1 (;@3;)))))
          (i32.store offset=536
            (local.get 0)
            (i32.add(i32.load offset=536
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@3;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 544))))
  (func $l1_init (type 1) (param i32)
    (local i32)
    (global.set 0
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 1)
      (local.get 0))
    (call $memset
      (i32.load offset=12
        (local.get 1))
      (i32.const 16384))
    (global.set 0
      (i32.add(local.get 1)
        (i32.const 16))))
  (func $step0_add (type 2) (param i32 i32)
    (local i32)
    (global.set 0
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 32))))
    (i32.store offset=28
      (local.get 2)
      (local.get 0))
    (i32.store offset=24
      (local.get 2)
      (local.get 1))
    (i32.store offset=8
      (local.get 2)
      (call $l1_addr
        (i32.const 2152)
        (i32.shr_s
          (i32.or
            (i32.load8_u offset=1
              (i32.load offset=24
                (local.get 2)))
            (i32.shl(i32.load8_u
                (i32.load offset=24
                  (local.get 2)))
              (i32.const 8)))
          (i32.const 4))))
    (i32.store offset=12
      (local.get 2)
      (i32.const 1))
    (i32.store offset=20
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.eqz
          (i32.ge_s
            (i32.load offset=20
              (local.get 2))
            (i32.const 6)))
        (then
          (i32.store offset=4
            (local.get 2)
            (i32.const 0))
          (i32.store offset=16
            (local.get 2)
            (i32.const 3))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16
                  (local.get 2))
                (i32.const 0))
              (then
                (if  
                  (i32.ge_s
                    (i32.load offset=12
                      (local.get 2))
                    (i32.const 0))
                  (then
                    (i32.store offset=4
                      (local.get 2)
                      (i32.or
                        (i32.load offset=4
                          (local.get 2))
                        (i32.shl(i32.load8_u
                            (i32.add(i32.load offset=24
                                (local.get 2))
                              (i32.load offset=12
                                (local.get 2))))
                          (i32.shl(i32.load offset=16
                              (local.get 2))
                            (i32.const 3)))))))
                (i32.store offset=16
                  (local.get 2)
                  (i32.add(i32.load offset=16
                      (local.get 2))
                    (i32.const -1)))
                (i32.store offset=12
                  (local.get 2)
                  (i32.add(i32.load offset=12
                      (local.get 2))
                    (i32.const 1)))
                (br 1 (;@4;)))))
          (i32.store
            (i32.add(i32.load offset=8
                (local.get 2))
              (i32.shl(i32.load offset=20
                  (local.get 2))
                (i32.const 2)))
            (i32.load offset=4
              (local.get 2)))
          (i32.store offset=20
            (local.get 2)
            (i32.add(i32.load offset=20
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@4;)))))
    (i32.store offset=24
      (i32.load offset=8
        (local.get 2))
      (i32.load offset=28
        (local.get 2)))
    (global.set 0
      (i32.add(local.get 2)
        (i32.const 32))))
  (func $l1_addr (type 7) (param i32 i32) (result i32)
    (local i32)
    (i32.store offset=12
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 16)))
      (local.get 0))
    (i32.store offset=8
      (local.get 2)
      (local.get 1))
    (i32.store
      (local.tee 0
        (i32.add(i32.load offset=12
            (local.get 2))
          (i32.shl(i32.load offset=8
              (local.get 2))
            (i32.const 2))))
      (i32.add(local.tee 0
          (i32.load
            (local.get 0)))
        (i32.const 1)))
    (i32.store offset=4
      (local.get 2)
      (local.get 0))
    (i32.add(i32.add(i32.add(i32.load offset=12
            (local.get 2))
          (i32.const 16384))
        (i32.mul(i32.load offset=8
            (local.get 2))
          (i32.const 25088)))
      (i32.mul(i32.load offset=4
          (local.get 2))
        (i32.const 28))))
  (func $genstep1 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 7))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 7))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 0))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 2152))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 102778984))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 1)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16664
                            (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1023))(i32.const 1)
)))(i32.const 1)
))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=20
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=20
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.xor(i32.load offset=16668
                                  (local.get 0))
                                (i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1048575))(i32.const 1)
)))(i32.const 1)
))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 6)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.xor(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2))))
                                    (i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2))))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=24
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $l212_val (type 7) (param i32 i32) (result i32)
    (local i32)
    (i32.store offset=28
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 32)))
      (local.get 0))
    (i32.store offset=24
      (local.get 2)
      (local.get 1))
    (i32.store offset=20
      (local.get 2)
      (i32.sub
        (i32.const 31)
        (i32.rem_s
          (i32.add(i32.mul(i32.load offset=28
                (local.get 2))
              (i32.const 20))
            (i32.const 16))
          (i32.const 32))))
    (i32.store offset=16
      (local.get 2)
      (i32.sub
        (i32.const 31)
        (i32.rem_s
          (i32.add(i32.mul(i32.load offset=28
                (local.get 2))
              (i32.const 20))
            (i32.const 43))
          (i32.const 32))))
    (block  
      (if  
        (i32.gt_s
          (i32.load offset=20
            (local.get 2))
          (i32.load offset=16
            (local.get 2)))
        (then
          (i32.store offset=12
            (local.get 2)
            (i32.shr_u
              (i32.load
                (i32.load offset=24
                  (local.get 2)))
              (i32.load offset=16
                (local.get 2))))
          (br 1 (;@1;))))
      (i32.store offset=12
        (local.get 2)
        (i32.or
          (i32.shl(i32.load
              (i32.load offset=24
                (local.get 2)))
            (i32.sub
              (i32.const 32)
              (i32.load offset=16
                (local.get 2))))
          (i32.shr_u
            (i32.load offset=4
              (i32.load offset=24
                (local.get 2)))
            (i32.load offset=16
              (local.get 2))))))
    (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=12
        (local.get 2)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 268435455))(i32.const 1)
)))(i32.const 1)
))
  (func $genstep2 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 7))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 6))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 1))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 102778984))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 2152))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 2)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.and(i32.load offset=16664
                            (local.get 0))
                          (i32.const 1023)))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=20
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=20
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.and(i32.and ;; REPLACEMENT 
(i32.or 
(i32.load offset=16668
                                  (local.get 0))(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16668
                                  (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.const 1)
)))
                              (i32.const 1048575)))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 5)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.and ;; REPLACEMENT 
(i32.or 
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.const 1)
))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=20
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep3 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 6))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 5))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 1))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 2152))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 102778984))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 3)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16664
                            (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1023))(i32.const 1)
)))(i32.const 1)
))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=16
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=16
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.and(i32.and ;; REPLACEMENT 
(i32.or 
(i32.load offset=16668
                                  (local.get 0))(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16668
                                  (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.const 1)
)))
                              (i32.const 1048575)))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 4)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.xor(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))
                                    (i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=20
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep4 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 5))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 5))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 0))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 102778984))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 2152))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 4)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.and(i32.load offset=16664
                            (local.get 0))
                          (i32.const 1023)))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=12
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=12
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.load offset=16668
                                  (local.get 0))(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16668
                                  (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.const 1)
))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1048575))(i32.const 1)
)))(i32.const 1)
))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 4)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.xor(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2))))
                                    (i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2))))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=16
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep5 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 5))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 4))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 1))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 2152))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 102778984))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 5)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16664
                            (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1023))(i32.const 1)
)))(i32.const 1)
))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=12
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=12
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.xor(i32.load offset=16668
                                  (local.get 0))
                                (i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1048575))(i32.const 1)
)))(i32.const 1)
))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 3)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.and ;; REPLACEMENT 
(i32.or 
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.const 1)
))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=16
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep6 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 4))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 4))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 0))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 102778984))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 2152))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 6)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.and(i32.load offset=16664
                            (local.get 0))
                          (i32.const 1023)))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=8
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=8
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.load offset=16668
                                  (local.get 0))(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16668
                                  (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10)))(i32.const 1)
))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1048575))(i32.const 1)
)))(i32.const 1)
))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 3)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.and ;; REPLACEMENT 
(i32.or 
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2))))(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2)))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2)))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.load offset=16672
                                            (local.get 0))
                                          (i32.const 2)))))(i32.const 1)
))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=12
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep7 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 4))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 3))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 1))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 2152))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 102778984))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 7)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16664
                            (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1023))(i32.const 1)
)))(i32.const 1)
))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=8
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=8
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.xor(i32.load offset=16668
                                  (local.get 0))
                                (i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1048575))(i32.const 1)
)))(i32.const 1)
))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 2)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.and ;; REPLACEMENT 
(i32.or 
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2)))))(i32.const 1)
))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=12
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep8 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 3))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 2))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 1))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 102778984))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 2152))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load offset=16696
            (local.get 0))
          (i32.const 4096))
        (then
          (call $memset
            (i32.add(local.get 0)
              (i32.const 16384))
            (i32.const 256))
          (i32.store offset=16692
            (local.get 0)
            (i32.sub
              (i32.load
                (i32.add(i32.load offset=16704
                    (local.get 0))
                  (i32.shl(i32.load offset=16696
                      (local.get 0))
                    (i32.const 2))))
              (i32.const 1)))
          (loop  
            (if  
              (i32.ge_s
                (i32.load offset=16692
                  (local.get 0))
                (i32.const 0))
              (then
                (i32.store offset=16656
                  (local.get 0)
                  (i32.add(i32.add(i32.add(i32.load offset=16704
                          (local.get 0))
                        (i32.mul(i32.load offset=16696
                            (local.get 0))
                          (i32.const 25088)))
                      (i32.mul(i32.load offset=16692
                          (local.get 0))
                        (i32.const 28)))
                    (i32.const 16384)))
                (i32.store offset=16668
                  (local.get 0)
                  (call $l212_val
                    (i32.const 8)
                    (i32.load offset=16656
                      (local.get 0))))
                (i32.store offset=16688
                  (local.get 0)
                  (i32.shr_u
                    (i32.load offset=16668
                      (local.get 0))
                    (i32.const 20)))
                (i32.store8
                  (local.tee 1
                    (i32.add(i32.load offset=16688
                        (local.get 0))
                      (i32.add(local.get 0)
                        (i32.const 16384))))
                  (i32.add(local.tee 1
                      (i32.load8_u
                        (local.get 1)))
                    (i32.const 1)))
                (i32.store offset=16684
                  (local.get 0)
                  (local.get 1))
                (i32.store
                  (i32.add(i32.add(local.get 0)
                      (i32.shl(i32.load offset=16688
                          (local.get 0))
                        (i32.const 6)))
                    (i32.shl(i32.load offset=16684
                        (local.get 0))
                      (i32.const 2)))
                  (i32.or
                    (i32.load offset=16692
                      (local.get 0))
                    (i32.shl(i32.load offset=16668
                        (local.get 0))
                      (i32.const 10))))
                (i32.store offset=16680
                  (local.get 0)
                  (i32.sub
                    (i32.load offset=16684
                      (local.get 0))
                    (i32.const 1)))
                (loop  
                  (if  
                    (i32.ge_s
                      (i32.load offset=16680
                        (local.get 0))
                      (i32.const 0))
                    (then
                      (i32.store offset=16664
                        (local.get 0)
                        (i32.load
                          (i32.add(i32.add(local.get 0)
                              (i32.shl(i32.load offset=16688
                                  (local.get 0))
                                (i32.const 6)))
                            (i32.shl(i32.load offset=16680
                                (local.get 0))
                              (i32.const 2)))))
                      (i32.store offset=16676
                        (local.get 0)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=16664
                            (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1023))(i32.const 1)
)))(i32.const 1)
))
                      (i32.store offset=16652
                        (local.get 0)
                        (i32.add(i32.add(i32.add(i32.load offset=16704
                                (local.get 0))
                              (i32.const 16384))
                            (i32.mul(i32.load offset=16696
                                (local.get 0))
                              (i32.const 25088)))
                          (i32.mul(i32.load offset=16676
                              (local.get 0))
                            (i32.const 28))))
                      (if  
                        (i32.ne
                          (i32.load offset=4
                            (i32.load offset=16656
                              (local.get 0)))
                          (i32.load offset=4
                            (i32.load offset=16652
                              (local.get 0))))
                        (then
                          (i32.store offset=16660
                            (local.get 0)
                            (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.xor(i32.load offset=16668
                                  (local.get 0))
                                (i32.shr_u
                                  (i32.load offset=16664
                                    (local.get 0))
                                  (i32.const 10))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1048575))(i32.const 1)
)))(i32.const 1)
))
                          (i32.store offset=16648
                            (local.get 0)
                            (call $l1_addr
                              (i32.load offset=16700
                                (local.get 0))
                              (i32.shr_u
                                (i32.load offset=16660
                                  (local.get 0))
                                (i32.const 8))))
                          (i32.store offset=16672
                            (local.get 0)
                            (i32.const 0))
                          (loop  
                            (if  
                              (i32.eqz
                                (i32.ge_s
                                  (i32.load offset=16672
                                    (local.get 0))
                                  (i32.const 1)))
                              (then
                                (i32.store
                                  (i32.add(i32.load offset=16648
                                      (local.get 0))
                                    (i32.shl(i32.load offset=16672
                                        (local.get 0))
                                      (i32.const 2)))
                                  (i32.xor(i32.load
                                      (i32.add(i32.load offset=16656
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))
                                    (i32.load
                                      (i32.add(i32.load offset=16652
                                          (local.get 0))
                                        (i32.shl(i32.add(i32.load offset=16672
                                              (local.get 0))
                                            (i32.const 1))
                                          (i32.const 2))))))
                                (i32.store offset=16672
                                  (local.get 0)
                                  (i32.add(i32.load offset=16672
                                      (local.get 0))
                                    (i32.const 1)))
                                (br 1 (;@8;)))))
                          (i32.store offset=8
                            (i32.load offset=16648
                              (local.get 0))
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (i32.store offset=16680
                        (local.get 0)
                        (i32.add(i32.load offset=16680
                            (local.get 0))
                          (i32.const -1)))
                      (br 1 (;@8;)))))
                (i32.store offset=16692
                  (local.get 0)
                  (i32.add(i32.load offset=16692
                      (local.get 0))
                    (i32.const -1)))
                (br 1 (;@8;)))))
          (i32.store offset=16696
            (local.get 0)
            (i32.add(i32.load offset=16696
                (local.get 0))
              (i32.const 1)))
          (br 1 (;@8;)))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $genstep9 (type 0)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 16720))))
    (i32.store offset=16716
      (local.get 0)
      (i32.const 2))
    (i32.store offset=16712
      (local.get 0)
      (i32.const 2))
    (i32.store offset=16708
      (local.get 0)
      (i32.const 0))
    (i32.store offset=16704
      (local.get 0)
      (i32.const 2152))
    (i32.store offset=16700
      (local.get 0)
      (i32.const 102778984))
    (call $l1_init
      (i32.load offset=16700
        (local.get 0)))
    (i32.store offset=16696
      (local.get 0)
      (i32.const 0))
    (loop  
      (block  
        (br_if 0 (;@2;)
          (i32.ge_s
            (i32.load offset=16696
              (local.get 0))
            (i32.const 4096)))
        (call $memset
          (i32.add(local.get 0)
            (i32.const 16384))
          (i32.const 256))
        (i32.store offset=16692
          (local.get 0)
          (i32.sub
            (i32.load
              (i32.add(i32.load offset=16704
                  (local.get 0))
                (i32.shl(i32.load offset=16696
                    (local.get 0))
                  (i32.const 2))))
            (i32.const 1)))
        (loop  
          (if  
            (i32.ge_s
              (i32.load offset=16692
                (local.get 0))
              (i32.const 0))
            (then
              (i32.store offset=16656
                (local.get 0)
                (i32.add(i32.add(i32.add(i32.load offset=16704
                        (local.get 0))
                      (i32.mul(i32.load offset=16696
                          (local.get 0))
                        (i32.const 25088)))
                    (i32.mul(i32.load offset=16692
                        (local.get 0))
                      (i32.const 28)))
                  (i32.const 16384)))
              (i32.store offset=16668
                (local.get 0)
                (call $l212_val
                  (i32.const 9)
                  (i32.load offset=16656
                    (local.get 0))))
              (i32.store offset=16688
                (local.get 0)
                (i32.shr_u
                  (i32.load offset=16668
                    (local.get 0))
                  (i32.const 20)))
              (i32.store8
                (local.tee 1
                  (i32.add(i32.load offset=16688
                      (local.get 0))
                    (i32.add(local.get 0)
                      (i32.const 16384))))
                (i32.add(local.tee 1
                    (i32.load8_u
                      (local.get 1)))
                  (i32.const 1)))
              (i32.store offset=16684
                (local.get 0)
                (local.get 1))
              (i32.store
                (i32.add(i32.add(local.get 0)
                    (i32.shl(i32.load offset=16688
                        (local.get 0))
                      (i32.const 6)))
                  (i32.shl(i32.load offset=16684
                      (local.get 0))
                    (i32.const 2)))
                (i32.or
                  (i32.load offset=16692
                    (local.get 0))
                  (i32.shl(i32.load offset=16668
                      (local.get 0))
                    (i32.const 10))))
              (i32.store offset=16680
                (local.get 0)
                (i32.sub
                  (i32.load offset=16684
                    (local.get 0))
                  (i32.const 1)))
              (loop  
                (if  
                  (i32.ge_s
                    (i32.load offset=16680
                      (local.get 0))
                    (i32.const 0))
                  (then
                    (i32.store offset=16664
                      (local.get 0)
                      (i32.load
                        (i32.add(i32.add(local.get 0)
                            (i32.shl(i32.load offset=16688
                                (local.get 0))
                              (i32.const 6)))
                          (i32.shl(i32.load offset=16680
                              (local.get 0))
                            (i32.const 2)))))
                    (i32.store offset=16676
                      (local.get 0)
                      (i32.and(i32.load offset=16664
                          (local.get 0))
                        (i32.const 1023)))
                    (i32.store offset=16652
                      (local.get 0)
                      (i32.add(i32.add(i32.add(i32.load offset=16704
                              (local.get 0))
                            (i32.const 16384))
                          (i32.mul(i32.load offset=16696
                              (local.get 0))
                            (i32.const 25088)))
                        (i32.mul(i32.load offset=16676
                            (local.get 0))
                          (i32.const 28))))
                    (i32.store offset=16660
                      (local.get 0)
                      (i32.and(i32.xor(i32.load offset=16668
                            (local.get 0))
                          (i32.shr_u
                            (i32.load offset=16664
                              (local.get 0))
                            (i32.const 10)))
                        (i32.const 1048575)))
                    (block  
                      (br_if 0 (;@7;)
                        (i32.load offset=16660
                          (local.get 0)))
                      (br_if 0 (;@7;)
                        (i32.eqz
                          (call $check_sol
                            (i32.or
                              (i32.load offset=16676
                                (local.get 0))
                              (i32.or
                                (i32.shl(i32.load offset=16696
                                    (local.get 0))
                                  (i32.const 20))
                                (i32.shl(i32.load offset=16692
                                    (local.get 0))
                                  (i32.const 10)))))))
                      (br 5 (;@2;)))
                    (i32.store offset=16680
                      (local.get 0)
                      (i32.add(i32.load offset=16680
                          (local.get 0))
                        (i32.const -1)))
                    (br 1 (;@6;)))))
              (i32.store offset=16692
                (local.get 0)
                (i32.add(i32.load offset=16692
                    (local.get 0))
                  (i32.const -1)))
              (br 1 (;@6;)))))
        (i32.store offset=16696
          (local.get 0)
          (i32.add(i32.load offset=16696
              (local.get 0))
            (i32.const 1)))
        (br 1 (;@6;))))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 16720))))
  (func $check_sol (type 3) (param i32) (result i32)
    (local i32)
    (global.set 0
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 2080))))
    (i32.store offset=2072
      (local.get 1)
      (local.get 0))
    (block  
      (if  
        (i32.eqz
          (call $tree_restore
            (i32.const 9)
            (i32.add(local.get 1)
              (i32.const 16))
            (i32.load offset=2072
              (local.get 1))))
        (then
          (i32.store offset=2076
            (local.get 1)
            (i32.const 0))
          (br 1 (;@1;))))
      (i32.store8 offset=140
        (i32.load
          (i32.const 2148))
        (i32.const 253))
      (i32.store8 offset=141
        (i32.load
          (i32.const 2148))
        (i32.const 64))
      (i32.store8 offset=142
        (i32.load
          (i32.const 2148))
        (i32.const 5))
      (call $memset
        (i32.add(i32.load
            (i32.const 2148))
          (i32.const 143))
        (i32.const 1344))
      (i32.store offset=12
        (local.get 1)
        (i32.const 0))
      (loop  
        (if  
          (i32.lt_s
            (i32.load offset=12
              (local.get 1))
            (i32.const 10752))
          (then
            (if  
              (i32.and(i32.load
                  (i32.add(i32.add(local.get 1)
                      (i32.const 16))
                    (i32.shl(i32.div_s
                        (i32.load offset=12
                          (local.get 1))
                        (i32.const 21))
                      (i32.const 2))))
                (i32.shl(i32.const 1)
                  (i32.sub
                    (i32.const 20)
                    (i32.rem_s
                      (i32.load offset=12
                        (local.get 1))
                      (i32.const 21)))))
              (then
                (i32.store8
                  (local.tee 0
                    (i32.add(i32.add(i32.load
                          (i32.const 2148))
                        (i32.const 143))
                      (i32.div_s
                        (i32.load offset=12
                          (local.get 1))
                        (i32.const 8))))
                  (i32.or
                    (i32.load8_u
                      (local.get 0))
                    (i32.shl(i32.const 1)
                      (i32.sub
                        (i32.const 7)
                        (i32.rem_s
                          (i32.load offset=12
                            (local.get 1))
                          (i32.const 8))))))))
            (i32.store offset=12
              (local.get 1)
              (i32.add(i32.load offset=12
                  (local.get 1))
                (i32.const 1)))
            (br 1 (;@4;)))))
      (i32.store offset=2076
        (local.get 1)
        (call $solution)))
    (local.set 0
      (i32.load offset=2076
        (local.get 1)))
    (global.set 0
      (i32.add(local.get 1)
        (i32.const 2080)))
    (local.get 0))
  (func $tree_restore (type 6) (param i32 i32 i32) (result i32)
    (local i32)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 48))))
    (i32.store offset=40
      (local.get 3)
      (local.get 0))
    (i32.store offset=36
      (local.get 3)
      (local.get 1))
    (i32.store offset=32
      (local.get 3)
      (local.get 2))
    (i32.store offset=20
      (local.get 3)
      (i32.shl(i32.const 1)
        (i32.sub
          (i32.load offset=40
            (local.get 3))
          (i32.const 1))))
    (i32.store offset=16
      (local.get 3)
      (i32.shr_u
        (i32.load offset=32
          (local.get 3))
        (i32.const 20)))
    (i32.store offset=12
      (local.get 3)
      (i32.and(i32.shr_u
          (i32.load offset=32
            (local.get 3))
          (i32.const 10))
        (i32.const 1023)))
    (i32.store offset=8
      (local.get 3)
      (i32.and(i32.load offset=32
          (local.get 3))
        (i32.const 1023)))
    (block  
      (if  
        (i32.eqz
          (i32.load offset=40
            (local.get 3)))
        (then
          (i32.store
            (i32.load offset=36
              (local.get 3))
            (i32.load offset=32
              (local.get 3)))
          (i32.store offset=44
            (local.get 3)
            (i32.const 1))
          (br 1 (;@1;))))
      (if  
        (i32.eqz
          (call $tree_restore
            (i32.sub
              (i32.load offset=40
                (local.get 3))
              (i32.const 1))
            (i32.load offset=36
              (local.get 3))
            (i32.load
              (i32.add(i32.add(i32.add(i32.add(i32.mul(i32.load offset=16
                          (local.get 3))
                        (i32.const 25088))
                      (select
                        (i32.const 102778984)
                        (i32.const 2152)
                        (i32.and(i32.sub
                            (i32.load offset=40
                              (local.get 3))
                            (i32.const 1))
                          (i32.const 1))))
                    (i32.mul(i32.load offset=12
                        (local.get 3))
                      (i32.const 28)))
                  (i32.shl(i32.sub
                      (i32.const 0)
                      (i32.shr_s
                        (i32.sub
                          (i32.load offset=40
                            (local.get 3))
                          (i32.const 1))
                        (i32.const 1)))
                    (i32.const 2)))
                (i32.const 16408)))))
        (then
          (i32.store offset=44
            (local.get 3)
            (i32.const 0))
          (br 1 (;@2;))))
      (if  
        (i32.eqz
          (call $tree_restore
            (i32.sub
              (i32.load offset=40
                (local.get 3))
              (i32.const 1))
            (i32.add(i32.load offset=36
                (local.get 3))
              (i32.shl(i32.load offset=20
                  (local.get 3))
                (i32.const 2)))
            (i32.load
              (i32.add(i32.add(i32.add(i32.add(i32.mul(i32.load offset=16
                          (local.get 3))
                        (i32.const 25088))
                      (select
                        (i32.const 102778984)
                        (i32.const 2152)
                        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.sub
                            (i32.load offset=40
                              (local.get 3))
                            (i32.const 1)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 1))(i32.const 1)
)))(i32.const 1)
)))
                    (i32.mul(i32.load offset=8
                        (local.get 3))
                      (i32.const 28)))
                  (i32.shl(i32.sub
                      (i32.const 0)
                      (i32.shr_s
                        (i32.sub
                          (i32.load offset=40
                            (local.get 3))
                          (i32.const 1))
                        (i32.const 1)))
                    (i32.const 2)))
                (i32.const 16408)))))
        (then
          (i32.store offset=44
            (local.get 3)
            (i32.const 0))
          (br 1 (;@3;))))
      (i32.store offset=28
        (local.get 3)
        (i32.const 0))
      (loop  
        (if  
          (i32.lt_s
            (i32.load offset=28
              (local.get 3))
            (i32.load offset=20
              (local.get 3)))
          (then
            (i32.store offset=24
              (local.get 3)
              (i32.const 0))
            (loop  
              (if  
                (i32.lt_s
                  (i32.load offset=24
                    (local.get 3))
                  (i32.load offset=20
                    (local.get 3)))
                (then
                  (if  
                    (i32.eq
                      (i32.load
                        (i32.add(i32.load offset=36
                            (local.get 3))
                          (i32.shl(i32.load offset=28
                              (local.get 3))
                            (i32.const 2))))
                      (i32.load
                        (i32.add(i32.load offset=36
                            (local.get 3))
                          (i32.shl(i32.add(i32.load offset=24
                                (local.get 3))
                              (i32.load offset=20
                                (local.get 3)))
                            (i32.const 2)))))
                    (then
                      (i32.store offset=44
                        (local.get 3)
                        (i32.const 0))
                      (br 5 (;@4;)))
                    (else
                      (i32.store offset=24
                        (local.get 3)
                        (i32.add(i32.load offset=24
                            (local.get 3))
                          (i32.const 1)))
                      (br 2 (;@7;))))
                  (unreachable))))
            (i32.store offset=28
              (local.get 3)
              (i32.add(i32.load offset=28
                  (local.get 3))
                (i32.const 1)))
            (br 1 (;@8;)))))
      (if  
        (i32.gt_u
          (i32.load
            (i32.load offset=36
              (local.get 3)))
          (i32.load
            (i32.add(i32.load offset=36
                (local.get 3))
              (i32.shl(i32.load offset=20
                  (local.get 3))
                (i32.const 2)))))
        (then
          (i32.store offset=28
            (local.get 3)
            (i32.const 0))
          (loop  
            (if  
              (i32.eqz
                (i32.ge_s
                  (i32.load offset=28
                    (local.get 3))
                  (i32.load offset=20
                    (local.get 3))))
              (then
                (i32.store offset=24
                  (local.get 3)
                  (i32.load
                    (i32.add(i32.load offset=36
                        (local.get 3))
                      (i32.shl(i32.load offset=28
                          (local.get 3))
                        (i32.const 2)))))
                (i32.store
                  (i32.add(i32.load offset=36
                      (local.get 3))
                    (i32.shl(i32.load offset=28
                        (local.get 3))
                      (i32.const 2)))
                  (i32.load
                    (i32.add(i32.load offset=36
                        (local.get 3))
                      (i32.shl(i32.add(i32.load offset=28
                            (local.get 3))
                          (i32.load offset=20
                            (local.get 3)))
                        (i32.const 2)))))
                (i32.store
                  (i32.add(i32.load offset=36
                      (local.get 3))
                    (i32.shl(i32.add(i32.load offset=28
                          (local.get 3))
                        (i32.load offset=20
                          (local.get 3)))
                      (i32.const 2)))
                  (i32.load offset=24
                    (local.get 3)))
                (i32.store offset=28
                  (local.get 3)
                  (i32.add(i32.load offset=28
                      (local.get 3))
                    (i32.const 1)))
                (br 1 (;@11;)))))))
      (i32.store offset=44
        (local.get 3)
        (i32.const 1)))
    (local.set 0
      (i32.load offset=44
        (local.get 3)))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 48)))
    (local.get 0))
  (func $solution (type 5) (result i32)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 3008))))
    (block  
      (if  
        (call $above_target)
        (then
          (i32.store8 offset=15
            (local.get 0)
            (i32.const 0))
          (drop
            (call $emscripten_asm_const_iii
              (i32.const 1584)
              (i32.add(local.get 0)
                (i32.const 15))
              (i32.const 0)))
          (i32.store offset=3004
            (local.get 0)
            (i32.const 0))
          (br 1 (;@1;))))
      (call $to_hex
        (local.tee 1
          (i32.add(local.get 0)
            (i32.const 16))))
      (i32.store8 offset=13
        (local.get 0)
        (i32.const 105))
      (i32.store8 offset=14
        (local.get 0)
        (i32.const 0))
      (i32.store
        (local.get 0)
        (local.get 1))
      (drop
        (call $emscripten_asm_const_iii
          (i32.const 1594)
          (i32.add(local.get 0)
            (i32.const 13))
          (local.get 0)))
      (i32.store offset=3004
        (local.get 0)
        (i32.const 1)))
    (local.set 1
      (i32.load offset=3004
        (local.get 0)))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 3008)))
    (local.get 1))
  (func $step (type 1) (param i32)
    (local i32)
    (global.set 0
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 1)
      (local.get 0))
    (block  
      (if  
        (i32.le_u
          (local.tee 0
            (i32.add(i32.load offset=12
                (local.get 1))
              (i32.const -1)))
          (i32.const 8))
        (then
          (block  
            (block  
              (block  
                (block  
                  (block  
                    (block  
                      (block  
                        (block  
                          (block  
                            (br_table 1 (;@10;) 2 (;@9;) 3 (;@8;) 4 (;@7;) 5 (;@6;) 6 (;@5;) 7 (;@4;) 8 (;@3;) 0 (;@11;)
                              (i32.sub
                                (local.get 0)
                                (i32.const 1))))
                          (call $genstep1)
                          (br 9 (;@2;)))
                        (call $genstep2)
                        (br 8 (;@3;)))
                      (call $genstep3)
                      (br 7 (;@4;)))
                    (call $genstep4)
                    (br 6 (;@5;)))
                  (call $genstep5)
                  (br 5 (;@6;)))
                (call $genstep6)
                (br 4 (;@7;)))
              (call $genstep7)
              (br 3 (;@8;)))
            (call $genstep8)
            (br 2 (;@9;)))
          (call $genstep9)
          (br 1 (;@10;))))
      (global.set 0
        (local.tee 0
          (i32.sub
            (global.get 0)
            (i32.const 16))))
      (i32.store offset=12
        (local.get 0)
        (i32.const 1289))
      (call $exit
        (i32.const 1))
      (unreachable))
    (global.set 0
      (i32.add(local.get 1)
        (i32.const 16))))
  (func $sha256 (type 4) (param i32 i32 i32)
    (local i32)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 192))))
    (i32.store offset=188
      (local.get 3)
      (local.get 0))
    (i32.store offset=184
      (local.get 3)
      (local.get 1))
    (i32.store offset=180
      (local.get 3)
      (local.get 2))
    (call $sha256_init
      (local.tee 0
        (i32.add(local.get 3)
          (i32.const 8))))
    (call $sha256_update
      (local.get 0)
      (i32.load offset=188
        (local.get 3))
      (i32.load offset=184
        (local.get 3)))
    (call $sha256_final
      (local.get 0)
      (i32.load offset=180
        (local.get 3)))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 192))))
  (func $sha256_init (type 1) (param i32)
    (local i32)
    (i32.store offset=12
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 16)))
      (local.get 0))
    (i32.store offset=8
      (local.get 1)
      (i32.const 0))
    (loop  
      (if  
        (i32.eqz
          (i32.ge_s
            (i32.load offset=8
              (local.get 1))
            (i32.const 8)))
        (then
          (i32.store
            (i32.add(i32.add(i32.load offset=12
                  (local.get 1))
                (i32.const 136))
              (i32.shl(i32.load offset=8
                  (local.get 1))
                (i32.const 2)))
            (i32.load
              (i32.add(i32.shl(i32.load offset=8
                    (local.get 1))
                  (i32.const 2))
                (i32.const 1552))))
          (i32.store offset=8
            (local.get 1)
            (i32.add(i32.load offset=8
                (local.get 1))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (i32.store offset=4
      (i32.load offset=12
        (local.get 1))
      (i32.const 0))
    (i32.store
      (i32.load offset=12
        (local.get 1))
      (i32.const 0)))
  (func $sha256_update (type 4) (param i32 i32 i32)
    (local i32)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 32))))
    (i32.store offset=28
      (local.get 3)
      (local.get 0))
    (i32.store offset=24
      (local.get 3)
      (local.get 1))
    (i32.store offset=20
      (local.get 3)
      (local.get 2))
    (i32.store offset=4
      (local.get 3)
      (i32.sub
        (i32.const 64)
        (i32.load offset=4
          (i32.load offset=28
            (local.get 3)))))
    (i32.store offset=8
      (local.get 3)
      (block (result i32)  
        (if  
          (i32.lt_u
            (i32.load offset=20
              (local.get 3))
            (i32.load offset=4
              (local.get 3)))
          (then
            (br 1 (;@1;)
              (i32.load offset=20
                (local.get 3)))))
        (i32.load offset=4
          (local.get 3))))
    (drop
      (call $memcpy
        (i32.add(i32.load offset=4
            (i32.load offset=28
              (local.get 3)))
          (i32.add(i32.load offset=28
              (local.get 3))
            (i32.const 8)))
        (i32.load offset=24
          (local.get 3))
        (i32.load offset=8
          (local.get 3))))
    (block  
      (if  
        (i32.lt_u
          (i32.add(i32.load offset=4
              (i32.load offset=28
                (local.get 3)))
            (i32.load offset=20
              (local.get 3)))
          (i32.const 64))
        (then
          (i32.store offset=4
            (local.tee 0
              (i32.load offset=28
                (local.get 3)))
            (i32.add(i32.load offset=4
                (local.get 0))
              (i32.load offset=20
                (local.get 3))))
          (br 1 (;@3;))))
      (i32.store offset=12
        (local.get 3)
        (i32.sub
          (i32.load offset=20
            (local.get 3))
          (i32.load offset=8
            (local.get 3))))
      (i32.store offset=16
        (local.get 3)
        (i32.shr_u
          (i32.load offset=12
            (local.get 3))
          (i32.const 6)))
      (i32.store
        (local.get 3)
        (i32.add(i32.load offset=24
            (local.get 3))
          (i32.load offset=8
            (local.get 3))))
      (call $sha256_transf
        (i32.load offset=28
          (local.get 3))
        (i32.add(i32.load offset=28
            (local.get 3))
          (i32.const 8))
        (i32.const 1))
      (call $sha256_transf
        (i32.load offset=28
          (local.get 3))
        (i32.load
          (local.get 3))
        (i32.load offset=16
          (local.get 3)))
      (i32.store offset=8
        (local.get 3)
        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=12
            (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const 63))(i32.const 1)
)))(i32.const 1)
))
      (drop
        (call $memcpy
          (i32.add(i32.load offset=28
              (local.get 3))
            (i32.const 8))
          (i32.add(i32.load
              (local.get 3))
            (i32.shl(i32.load offset=16
                (local.get 3))
              (i32.const 6)))
          (i32.load offset=8
            (local.get 3))))
      (i32.store offset=4
        (i32.load offset=28
          (local.get 3))
        (i32.load offset=8
          (local.get 3)))
      (i32.store
        (local.tee 0
          (i32.load offset=28
            (local.get 3)))
        (i32.add(i32.load
            (local.get 0))
          (i32.shl(i32.add(i32.load offset=16
                (local.get 3))
              (i32.const 1))
            (i32.const 6)))))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 32))))
  (func $sha256_final (type 2) (param i32 i32)
    (local i32)
    (global.set 0
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 32))))
    (i32.store offset=28
      (local.get 2)
      (local.get 0))
    (i32.store offset=24
      (local.get 2)
      (local.get 1))
    (i32.store offset=20
      (local.get 2)
      (i32.add(i32.lt_u
          (i32.const 55)
          (i32.and(i32.load offset=4
              (i32.load offset=28
                (local.get 2)))
            (i32.const 63)))
        (i32.const 1)))
    (i32.store offset=12
      (local.get 2)
      (i32.shl(i32.add(i32.load
            (i32.load offset=28
              (local.get 2)))
          (i32.load offset=4
            (i32.load offset=28
              (local.get 2))))
        (i32.const 3)))
    (i32.store offset=16
      (local.get 2)
      (i32.shl(i32.load offset=20
          (local.get 2))
        (i32.const 6)))
    (call $memset
      (i32.add(i32.load offset=4
          (i32.load offset=28
            (local.get 2)))
        (i32.add(i32.load offset=28
            (local.get 2))
          (i32.const 8)))
      (i32.sub
        (i32.load offset=16
          (local.get 2))
        (i32.load offset=4
          (i32.load offset=28
            (local.get 2)))))
    (i32.store8
      (i32.add(i32.load offset=4
          (i32.load offset=28
            (local.get 2)))
        (i32.add(i32.load offset=28
            (local.get 2))
          (i32.const 8)))
      (i32.const 128))
    (i32.store8 offset=7
      (i32.add(i32.load offset=16
          (local.get 2))
        (i32.load offset=28
          (local.get 2)))
      (i32.load offset=12
        (local.get 2)))
    (i32.store8 offset=6
      (i32.add(i32.load offset=16
          (local.get 2))
        (i32.load offset=28
          (local.get 2)))
      (i32.shr_u
        (i32.load offset=12
          (local.get 2))
        (i32.const 8)))
    (i32.store8 offset=5
      (i32.add(i32.load offset=16
          (local.get 2))
        (i32.load offset=28
          (local.get 2)))
      (i32.shr_u
        (i32.load offset=12
          (local.get 2))
        (i32.const 16)))
    (i32.store8 offset=4
      (i32.add(i32.load offset=16
          (local.get 2))
        (i32.load offset=28
          (local.get 2)))
      (i32.shr_u
        (i32.load offset=12
          (local.get 2))
        (i32.const 24)))
    (call $sha256_transf
      (i32.load offset=28
        (local.get 2))
      (i32.add(i32.load offset=28
          (local.get 2))
        (i32.const 8))
      (i32.load offset=20
        (local.get 2)))
    (i32.store offset=8
      (local.get 2)
      (i32.const 0))
    (loop  
      (if  
        (i32.eqz
          (i32.ge_s
            (i32.load offset=8
              (local.get 2))
            (i32.const 8)))
        (then
          (i32.store8 offset=3
            (i32.add(i32.load offset=24
                (local.get 2))
              (i32.shl(i32.load offset=8
                  (local.get 2))
                (i32.const 2)))
            (i32.load
              (i32.add(i32.add(i32.load offset=28
                    (local.get 2))
                  (i32.const 136))
                (i32.shl(i32.load offset=8
                    (local.get 2))
                  (i32.const 2)))))
          (i32.store8 offset=2
            (i32.add(i32.load offset=24
                (local.get 2))
              (i32.shl(i32.load offset=8
                  (local.get 2))
                (i32.const 2)))
            (i32.shr_u
              (i32.load
                (i32.add(i32.add(i32.load offset=28
                      (local.get 2))
                    (i32.const 136))
                  (i32.shl(i32.load offset=8
                      (local.get 2))
                    (i32.const 2))))
              (i32.const 8)))
          (i32.store8 offset=1
            (i32.add(i32.load offset=24
                (local.get 2))
              (i32.shl(i32.load offset=8
                  (local.get 2))
                (i32.const 2)))
            (i32.shr_u
              (i32.load
                (i32.add(i32.add(i32.load offset=28
                      (local.get 2))
                    (i32.const 136))
                  (i32.shl(i32.load offset=8
                      (local.get 2))
                    (i32.const 2))))
              (i32.const 16)))
          (i32.store8
            (i32.add(i32.load offset=24
                (local.get 2))
              (i32.shl(i32.load offset=8
                  (local.get 2))
                (i32.const 2)))
            (i32.shr_u
              (i32.load
                (i32.add(i32.add(i32.load offset=28
                      (local.get 2))
                    (i32.const 136))
                  (i32.shl(i32.load offset=8
                      (local.get 2))
                    (i32.const 2))))
              (i32.const 24)))
          (i32.store offset=8
            (local.get 2)
            (i32.add(i32.load offset=8
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (global.set 0
      (i32.add(local.get 2)
        (i32.const 32))))
  (func $sha256_transf (type 4) (param i32 i32 i32)
    (local i32)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 336))))
    (i32.store offset=332
      (local.get 3)
      (local.get 0))
    (i32.store offset=328
      (local.get 3)
      (local.get 1))
    (i32.store offset=324
      (local.get 3)
      (local.get 2))
    (i32.store offset=16
      (local.get 3)
      (i32.const 0))
    (loop  
      (if  
        (i32.eqz
          (i32.ge_s
            (i32.load offset=16
              (local.get 3))
            (i32.load offset=324
              (local.get 3))))
        (then
          (i32.store offset=20
            (local.get 3)
            (i32.add(i32.load offset=328
                (local.get 3))
              (i32.shl(i32.load offset=16
                  (local.get 3))
                (i32.const 6))))
          (i32.store offset=12
            (local.get 3)
            (i32.const 0))
          (loop  
            (if  
              (i32.eqz
                (i32.ge_s
                  (i32.load offset=12
                    (local.get 3))
                  (i32.const 16)))
              (then
                (i32.store
                  (i32.add(i32.sub
                      (local.get 3)
                      (i32.const -64))
                    (i32.shl(i32.load offset=12
                        (local.get 3))
                      (i32.const 2)))
                  (i32.or
                    (i32.or
                      (i32.or
                        (i32.load8_u offset=3
                          (i32.add(i32.load offset=20
                              (local.get 3))
                            (i32.shl(i32.load offset=12
                                (local.get 3))
                              (i32.const 2))))
                        (i32.shl(i32.load8_u offset=2
                            (i32.add(i32.load offset=20
                                (local.get 3))
                              (i32.shl(i32.load offset=12
                                  (local.get 3))
                                (i32.const 2))))
                          (i32.const 8)))
                      (i32.shl(i32.load8_u offset=1
                          (i32.add(i32.load offset=20
                              (local.get 3))
                            (i32.shl(i32.load offset=12
                                (local.get 3))
                              (i32.const 2))))
                        (i32.const 16)))
                    (i32.shl(i32.load8_u
                        (i32.add(i32.load offset=20
                            (local.get 3))
                          (i32.shl(i32.load offset=12
                              (local.get 3))
                            (i32.const 2))))
                      (i32.const 24))))
                (i32.store offset=12
                  (local.get 3)
                  (i32.add(i32.load offset=12
                      (local.get 3))
                    (i32.const 1)))
                (br 1 (;@3;)))))
          (i32.store offset=12
            (local.get 3)
            (i32.const 16))
          (loop  
            (if  
              (i32.eqz
                (i32.ge_s
                  (i32.load offset=12
                    (local.get 3))
                  (i32.const 64)))
              (then
                (i32.store
                  (i32.add(local.tee 0
                      (i32.sub
                        (local.get 3)
                        (i32.const -64)))
                    (i32.shl(i32.load offset=12
                        (local.get 3))
                      (i32.const 2)))
                  (i32.add(i32.load
                      (i32.add(local.get 0)
                        (i32.shl(i32.sub
                            (i32.load offset=12
                              (local.get 3))
                            (i32.const 16))
                          (i32.const 2))))
                    (i32.add(i32.add(i32.load
                          (i32.add(local.get 0)
                            (i32.shl(i32.sub
                                (i32.load offset=12
                                  (local.get 3))
                                (i32.const 7))
                              (i32.const 2))))
                        (i32.xor(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                              (i32.shl(i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 15))
                              (i32.shr_u
                                (i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 17)))(i32.or
                              (i32.shl(i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 13))
                              (i32.shr_u
                                (i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 19))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                              (i32.shl(i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 15))
                              (i32.shr_u
                                (i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 17))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                              (i32.shl(i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 13))
                              (i32.shr_u
                                (i32.load
                                  (i32.add(local.get 0)
                                    (i32.shl(i32.sub
                                        (i32.load offset=12
                                          (local.get 3))
                                        (i32.const 2))
                                      (i32.const 2))))
                                (i32.const 19))))(i32.const 1)
)))
                          (i32.shr_u
                            (i32.load
                              (i32.add(local.get 0)
                                (i32.shl(i32.sub
                                    (i32.load offset=12
                                      (local.get 3))
                                    (i32.const 2))
                                  (i32.const 2))))
                            (i32.const 10))))
                      (i32.and ;; REPLACEMENT 
(i32.or 
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 25))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 7)))(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 14))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 18))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 25))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 7))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 14))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 18))))(i32.const 1)
)))(i32.shr_u
                          (i32.load
                            (i32.add(local.get 0)
                              (i32.shl(i32.sub
                                  (i32.load offset=12
                                    (local.get 3))
                                  (i32.const 15))
                                (i32.const 2))))
                          (i32.const 3)))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 25))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 7)))(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 14))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 18))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 25))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 7))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                            (i32.shl(i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 14))
                            (i32.shr_u
                              (i32.load
                                (i32.add(local.get 0)
                                  (i32.shl(i32.sub
                                      (i32.load offset=12
                                        (local.get 3))
                                      (i32.const 15))
                                    (i32.const 2))))
                              (i32.const 18))))(i32.const 1)
))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.shr_u
                          (i32.load
                            (i32.add(local.get 0)
                              (i32.shl(i32.sub
                                  (i32.load offset=12
                                    (local.get 3))
                                  (i32.const 15))
                                (i32.const 2))))
                          (i32.const 3)))(i32.const 1)
))))))
                (i32.store offset=12
                  (local.get 3)
                  (i32.add(i32.load offset=12
                      (local.get 3))
                    (i32.const 1)))
                (br 1 (;@5;)))))
          (i32.store offset=12
            (local.get 3)
            (i32.const 0))
          (loop  
            (if  
              (i32.eqz
                (i32.ge_s
                  (i32.load offset=12
                    (local.get 3))
                  (i32.const 8)))
              (then
                (i32.store
                  (i32.add(i32.add(local.get 3)
                      (i32.const 32))
                    (i32.shl(i32.load offset=12
                        (local.get 3))
                      (i32.const 2)))
                  (i32.load
                    (i32.add(i32.add(i32.load offset=332
                          (local.get 3))
                        (i32.const 136))
                      (i32.shl(i32.load offset=12
                          (local.get 3))
                        (i32.const 2)))))
                (i32.store offset=12
                  (local.get 3)
                  (i32.add(i32.load offset=12
                      (local.get 3))
                    (i32.const 1)))
                (br 1 (;@7;)))))
          (i32.store offset=12
            (local.get 3)
            (i32.const 0))
          (loop  
            (if  
              (i32.eqz
                (i32.ge_s
                  (i32.load offset=12
                    (local.get 3))
                  (i32.const 64)))
              (then
                (i32.store offset=28
                  (local.get 3)
                  (i32.add(i32.load
                      (i32.add(i32.sub
                          (local.get 3)
                          (i32.const -64))
                        (i32.shl(i32.load offset=12
                            (local.get 3))
                          (i32.const 2))))
                    (i32.add(i32.load
                        (i32.add(i32.shl(i32.load offset=12
                              (local.get 3))
                            (i32.const 2))
                          (i32.const 1296)))
                      (i32.add(i32.add(i32.load offset=60
                            (local.get 3))
                          (i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                              (i32.shl(i32.load offset=48
                                  (local.get 3))
                                (i32.const 7))
                              (i32.shr_u
                                (i32.load offset=48
                                  (local.get 3))
                                (i32.const 25)))(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 26))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 6)))(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 21))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 11))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 26))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 6))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 21))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 11))))(i32.const 1)
))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                              (i32.shl(i32.load offset=48
                                  (local.get 3))
                                (i32.const 7))
                              (i32.shr_u
                                (i32.load offset=48
                                  (local.get 3))
                                (i32.const 25))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 26))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 6)))(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 21))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 11))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 26))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 6))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                                (i32.shl(i32.load offset=48
                                    (local.get 3))
                                  (i32.const 21))
                                (i32.shr_u
                                  (i32.load offset=48
                                    (local.get 3))
                                  (i32.const 11))))(i32.const 1)
))))(i32.const 1)
))))
                        (i32.and ;; REPLACEMENT 
(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=48
                              (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=52
                              (local.get 3)))(i32.const 1)
)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=56
                              (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.load offset=48
                                (local.get 3))(i32.const -1))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=48
                                (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -1))(i32.const 1)
))))(i32.const 1)
)))(i32.const 1)
))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and(i32.load offset=48
                              (local.get 3))
                            (i32.load offset=52
                              (local.get 3))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and(i32.load offset=56
                              (local.get 3))
                            (i32.and ;; REPLACEMENT 
(i32.or 
(i32.load offset=48
                                (local.get 3))(i32.const -1))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=48
                                (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -1))(i32.const 1)
)))))(i32.const 1)
)))))))
                (i32.store offset=24
                  (local.get 3)
                  (i32.add(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                        (i32.shl(i32.load offset=32
                            (local.get 3))
                          (i32.const 10))
                        (i32.shr_u
                          (i32.load offset=32
                            (local.get 3))
                          (i32.const 22)))(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 30))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 2)))(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 19))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 13))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 30))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 2))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 19))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 13))))(i32.const 1)
))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                        (i32.shl(i32.load offset=32
                            (local.get 3))
                          (i32.const 10))
                        (i32.shr_u
                          (i32.load offset=32
                            (local.get 3))
                          (i32.const 22))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and ;; REPLACEMENT 
(i32.or 
(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 30))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 2)))(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 19))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 13))))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 30))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 2))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or
                          (i32.shl(i32.load offset=32
                              (local.get 3))
                            (i32.const 19))
                          (i32.shr_u
                            (i32.load offset=32
                              (local.get 3))
                            (i32.const 13))))(i32.const 1)
))))(i32.const 1)
)))
                    (i32.xor(i32.and(i32.load offset=36
                          (local.get 3))
                        (i32.load offset=40
                          (local.get 3)))
                      (i32.and ;; REPLACEMENT 
(i32.or 
(i32.and(i32.load offset=32
                            (local.get 3))
                          (i32.load offset=36
                            (local.get 3)))(i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=32
                            (local.get 3)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.load offset=40
                            (local.get 3)))(i32.const 1)
)))(i32.const 1)
))(i32.or 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and(i32.load offset=32
                            (local.get 3))
                          (i32.load offset=36
                            (local.get 3))))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.and(i32.load offset=32
                            (local.get 3))
                          (i32.load offset=40
                            (local.get 3))))(i32.const 1)
))))))
                (i32.store offset=60
                  (local.get 3)
                  (i32.load offset=56
                    (local.get 3)))
                (i32.store offset=56
                  (local.get 3)
                  (i32.load offset=52
                    (local.get 3)))
                (i32.store offset=52
                  (local.get 3)
                  (i32.load offset=48
                    (local.get 3)))
                (i32.store offset=48
                  (local.get 3)
                  (i32.add(i32.load offset=44
                      (local.get 3))
                    (i32.load offset=28
                      (local.get 3))))
                (i32.store offset=44
                  (local.get 3)
                  (i32.load offset=40
                    (local.get 3)))
                (i32.store offset=40
                  (local.get 3)
                  (i32.load offset=36
                    (local.get 3)))
                (i32.store offset=36
                  (local.get 3)
                  (i32.load offset=32
                    (local.get 3)))
                (i32.store offset=32
                  (local.get 3)
                  (i32.add(i32.load offset=28
                      (local.get 3))
                    (i32.load offset=24
                      (local.get 3))))
                (i32.store offset=12
                  (local.get 3)
                  (i32.add(i32.load offset=12
                      (local.get 3))
                    (i32.const 1)))
                (br 1 (;@9;)))))
          (i32.store offset=12
            (local.get 3)
            (i32.const 0))
          (loop  
            (if  
              (i32.eqz
                (i32.ge_s
                  (i32.load offset=12
                    (local.get 3))
                  (i32.const 8)))
              (then
                (i32.store
                  (local.tee 0
                    (i32.add(i32.add(i32.load offset=332
                          (local.get 3))
                        (i32.const 136))
                      (i32.shl(i32.load offset=12
                          (local.get 3))
                        (i32.const 2))))
                  (i32.add(i32.load
                      (local.get 0))
                    (i32.load
                      (i32.add(i32.add(local.get 3)
                          (i32.const 32))
                        (i32.shl(i32.load offset=12
                            (local.get 3))
                          (i32.const 2))))))
                (i32.store offset=12
                  (local.get 3)
                  (i32.add(i32.load offset=12
                      (local.get 3))
                    (i32.const 1)))
                (br 1 (;@11;)))))
          (i32.store offset=16
            (local.get 3)
            (i32.add(i32.load offset=16
                (local.get 3))
              (i32.const 1)))
          (br 1 (;@11;)))))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 336))))
  (func $mine (type 2) (param i32 i32)
    (local i32)
    (global.set 0
      (local.tee 2
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 2)
      (local.get 0))
    (i32.store offset=8
      (local.get 2)
      (local.get 1))
    (call $from_hex
      (i32.const 205555816)
      (i32.load offset=12
        (local.get 2))
      (i32.const 140))
    (call $from_hex
      (i32.const 205557312)
      (i32.load offset=8
        (local.get 2))
      (i32.const 32))
    (call $step0)
    (i32.store offset=4
      (local.get 2)
      (i32.const 1))
    (loop  
      (if  
        (i32.le_s
          (i32.load offset=4
            (local.get 2))
          (i32.const 9))
        (then
          (call $step
            (i32.load offset=4
              (local.get 2)))
          (i32.store offset=4
            (local.get 2)
            (i32.add(i32.load offset=4
                (local.get 2))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (global.set 0
      (i32.add(local.get 2)
        (i32.const 16))))
  (func $from_hex (type 4) (param i32 i32 i32)
    (local i32)
    (global.set 0
      (local.tee 3
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 3)
      (local.get 0))
    (i32.store offset=8
      (local.get 3)
      (local.get 1))
    (i32.store offset=4
      (local.get 3)
      (local.get 2))
    (i32.store
      (local.get 3)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load
            (local.get 3))
          (i32.load offset=4
            (local.get 3)))
        (then
          (local.set 0
            (call $hex2int
              (i32.load8_s
                (i32.add(i32.load offset=8
                    (local.get 3))
                  (i32.shl(i32.load
                      (local.get 3))
                    (i32.const 1))))))
          (local.set 1
            (call $hex2int
              (i32.load8_s
                (i32.add(i32.load offset=8
                    (local.get 3))
                  (i32.add(i32.shl(i32.load
                        (local.get 3))
                      (i32.const 1))
                    (i32.const 1))))))
          (i32.store8
            (i32.add(i32.load offset=12
                (local.get 3))
              (i32.load
                (local.get 3)))
            (i32.add(local.get 1)
              (i32.shl(local.get 0)
                (i32.const 4))))
          (i32.store
            (local.get 3)
            (i32.add(i32.load
                (local.get 3))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (block  
      (br_if 0 (;@3;)
        (i32.eqz
          (i32.load8_u
            (i32.add(i32.load offset=8
                (local.get 3))
              (i32.shl(i32.load
                  (local.get 3))
                (i32.const 1)))))))
    (global.set 0
      (i32.add(local.get 3)
        (i32.const 16))))
  (func $hex2int (type 3) (param i32) (result i32)
    (local i32)
    (i32.store8 offset=15
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 16)))
      (local.get 0))
    (block (result i32)  
      (block  
        (br_if 0 (;@2;)
          (i32.gt_s
            (i32.const 48)
            (i32.load8_s offset=15
              (local.get 1))))
        (br_if 0 (;@2;)
          (i32.gt_s
            (i32.load8_s offset=15
              (local.get 1))
            (i32.const 57)))
        (br 1 (;@1;)
          (i32.sub
            (i32.load8_s offset=15
              (local.get 1))
            (i32.const 48))))
      (block (result i32)  
        (block  
          (br_if 0 (;@4;)
            (i32.gt_s
              (i32.const 65)
              (i32.load8_s offset=15
                (local.get 1))))
          (br_if 0 (;@4;)
            (i32.gt_s
              (i32.load8_s offset=15
                (local.get 1))
              (i32.const 70)))
          (br 1 (;@3;)
            (i32.add(i32.load8_s offset=15
                (local.get 1))
              (i32.const -55))))
        (block (result i32)  
          (block  
            (br_if 0 (;@6;)
              (i32.gt_s
                (i32.const 97)
                (i32.load8_s offset=15
                  (local.get 1))))
            (br_if 0 (;@6;)
              (i32.gt_s
                (i32.load8_s offset=15
                  (local.get 1))
                (i32.const 102)))
            (br 1 (;@5;)
              (i32.add(i32.load8_s offset=15
                  (local.get 1))
                (i32.const -87))))
          (i32.const -1)))))
  (func $above_target (type 5) (result i32)
    (local i32 i32)
    (global.set 0
      (local.tee 0
        (i32.sub
          (global.get 0)
          (i32.const 48))))
    (call $sha256
      (i32.const 205555816)
      (i32.const 1487)
      (local.get 0))
    (call $sha256
      (local.get 0)
      (i32.const 32)
      (local.get 0))
    (i32.store offset=40
      (local.get 0)
      (i32.const 0))
    (block  
      (loop  
        (if  
          (i32.lt_s
            (i32.load offset=40
              (local.get 0))
            (i32.const 32))
          (then
            (if  
              (i32.lt_s
                (i32.load8_u
                  (i32.add(local.get 0)
                    (i32.sub
                      (i32.const 31)
                      (i32.load offset=40
                        (local.get 0)))))
                (i32.load8_u offset=205557312
                  (i32.load offset=40
                    (local.get 0))))
              (then
                (i32.store offset=44
                  (local.get 0)
                  (i32.const 0))
                (br 3 (;@1;))))
            (if  
              (i32.gt_s
                (i32.load8_u
                  (i32.add(local.get 0)
                    (i32.sub
                      (i32.const 31)
                      (i32.load offset=40
                        (local.get 0)))))
                (i32.load8_u offset=205557312
                  (i32.load offset=40
                    (local.get 0))))
              (then
                (i32.store offset=44
                  (local.get 0)
                  (i32.const 1))
                (br 3 (;@2;)))
              (else
                (i32.store offset=40
                  (local.get 0)
                  (i32.add(i32.load offset=40
                      (local.get 0))
                    (i32.const 1)))
                (br 2 (;@3;))))
            (unreachable))))
      (i32.store offset=44
        (local.get 0)
        (i32.const -1)))
    (local.set 1
      (i32.load offset=44
        (local.get 0)))
    (global.set 0
      (i32.add(local.get 0)
        (i32.const 48)))
    (local.get 1))
  (func $to_hex (type 1) (param i32)
    (local i32)
    (global.set 0
      (local.tee 1
        (i32.sub
          (global.get 0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get 1)
      (local.get 0))
    (i32.store offset=8
      (local.get 1)
      (i32.const 205555816))
    (i32.store offset=4
      (local.get 1)
      (i32.const 1487))
    (i32.store
      (local.get 1)
      (i32.const 0))
    (loop  
      (if  
        (i32.lt_s
          (i32.load
            (local.get 1))
          (i32.load offset=4
            (local.get 1)))
        (then
          (i32.store8 offset=15
            (local.tee 0
              (i32.sub
                (global.get 0)
                (i32.const 16)))
            (i32.div_s
              (i32.load8_u
                (i32.add(i32.load offset=8
                    (local.get 1))
                  (i32.load
                    (local.get 1))))
              (i32.const 16)))
          (local.set 0
            (i32.load8_s offset=1631
              (i32.load8_u offset=15
                (local.get 0))))
          (i32.store8
            (i32.add(i32.load offset=12
                (local.get 1))
              (i32.shl(i32.load
                  (local.get 1))
                (i32.const 1)))
            (local.get 0))
          (i32.store8 offset=15
            (local.tee 0
              (i32.sub
                (global.get 0)
                (i32.const 16)))
            (i32.rem_s
              (i32.load8_u
                (i32.add(i32.load offset=8
                    (local.get 1))
                  (i32.load
                    (local.get 1))))
              (i32.const 16)))
          (local.set 0
            (i32.load8_s offset=1631
              (i32.load8_u offset=15
                (local.get 0))))
          (i32.store8
            (i32.add(i32.load offset=12
                (local.get 1))
              (i32.add(i32.shl(i32.load
                    (local.get 1))
                  (i32.const 1))
                (i32.const 1)))
            (local.get 0))
          (i32.store
            (local.get 1)
            (i32.add(i32.load
                (local.get 1))
              (i32.const 1)))
          (br 1 (;@1;)))))
    (i32.store8
      (i32.add(i32.load offset=12
          (local.get 1))
        (i32.shl(i32.load
            (local.get 1))
          (i32.const 1)))
      (i32.const 0))
    (global.set 0
      (i32.add(local.get 1)
        (i32.const 16))))
  (func $stackSave (type 5) (result i32)
    (global.get 0))
  (func $stackAlloc (type 3) (param i32) (result i32)
    (global.set 0
      (local.tee 0
        (i32.sub 
(i32.sub 
(i32.const 0)
(i32.or ;; REPLACEMENT 
(i32.sub 
(i32.sub 
(i32.const 0)
(i32.sub
            (global.get 0)
            (local.get 0)))(i32.const 1)
)(i32.sub 
(i32.sub 
(i32.const 0)
(i32.const -16))(i32.const 1)
)))(i32.const 1)
)))
    (local.get 0))
  (func $stackRestore (type 1) (param i32)
    (global.set 0
      (local.get 0)))
  (func $__growWasmMemory (type 3) (param i32) (result i32)
    (memory.grow
      (local.get 0)))
  (global (;0;) (mut i32) (i32.const 210800384))
  (global (;1;) i32 (i32.const 205557344))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "mine" (func $mine))
  (export "__errno_location" (func $__errno_location))
  (export "malloc" (func $dlmalloc))
  (export "free" (func $dlfree))
  (export "__data_end" (global 1))
  (export "stackSave" (func $stackSave))
  (export "stackAlloc" (func $stackAlloc))
  (export "stackRestore" (func $stackRestore))
  (export "__growWasmMemory" (func $__growWasmMemory))
  (data (;0;) (i32.const 1024) "\08\c9\bc\f3g\e6\09j;\a7\ca\84\85\aeg\bb+\f8\94\fer\f3n<\f16\1d_:\f5O\a5\d1\82\e6\ad\7fR\0eQ\1fl>+\8ch\05\9bk\bdA\fb\ab\d9\83\1fy!~\13\19\cd\e0[\00\01\02\03\04\05\06\07\08\09\0a\0b\0c\0d\0e\0f\0e\0a\04\08\09\0f\0d\06\01\0c\00\02\0b\07\05\03\0b\08\0c\00\05\02\0f\0d\0a\0e\03\06\07\01\09\04\07\09\03\01\0d\0c\0b\0e\02\06\05\0a\04\00\0f\08\09\00\05\07\02\04\0a\0f\0e\01\0b\0c\06\08\03\0d\02\0c\06\0a\00\0b\08\03\04\0d\07\05\0f\0e\01\09\0c\05\01\0f\0e\0d\04\0a\00\07\06\03\09\02\08\0b\0d\0b\07\0e\0c\01\03\09\05\00\0f\04\08\06\02\0a\06\0f\0e\09\0b\03\00\08\0c\02\0d\07\01\04\0a\05\0a\02\08\04\07\06\01\05\0f\0b\09\0e\03\0c\0d\00\00\01\02\03\04\05\06\07\08\09\0a\0b\0c\0d\0e\0f\0e\0a\04\08\09\0f\0d\06\01\0c\00\02\0b\07\05\03ZcashPoW\00wtf\00\00\00\00\98/\8aB\91D7q\cf\fb\c0\b5\a5\db\b5\e9[\c2V9\f1\11\f1Y\a4\82?\92\d5^\1c\ab\98\aa\07\d8\01[\83\12\be\851$\c3}\0cUt]\ber\fe\b1\de\80\a7\06\dc\9bt\f1\9b\c1\c1i\9b\e4\86G\be\ef\c6\9d\c1\0f\cc\a1\0c$o,\e9-\aa\84tJ\dc\a9\b0\5c\da\88\f9vRQ>\98m\c61\a8\c8'\03\b0\c7\7fY\bf\f3\0b\e0\c6G\91\a7\d5Qc\ca\06g))\14\85\0a\b7'8!\1b.\fcm,M\13\0d8STs\0ae\bb\0ajv.\c9\c2\81\85,r\92\a1\e8\bf\a2Kf\1a\a8p\8bK\c2\a3Ql\c7\19\e8\92\d1$\06\99\d6\855\0e\f4p\a0j\10\16\c1\a4\19\08l7\1eLwH'\b5\bc\b04\b3\0c\1c9J\aa\d8NO\ca\9c[\f3o.h\ee\82\8ftoc\a5x\14x\c8\84\08\02\c7\8c\fa\ff\be\90\eblP\a4\f7\a3\f9\be\f2xq\c6g\e6\09j\85\aeg\bbr\f3n<:\f5O\a5\7fR\0eQ\8ch\05\9b\ab\d9\83\1f\19\cd\e0[above ();\00{ submit (Pointer_stringify ($0)); }\000123456789abcdef"))

