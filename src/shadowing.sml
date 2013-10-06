(*

  Concept of shadowing variables

*)

val a = 10
(* a: int
   a -> 10 *)

val b = a * 2 
(* a -> 10
   b -> 20 *)

val a = 5 (* This is not an assigment statement, there is now way to mutate variables in ML. It is now shadowed *)
(* a -> 5, b -> 20 *)

val c = b 
(* a -> 5, b -> 20, c -> 20 *)

val d = a
(* ..., d -> 5 *)

val a = a + 1
(* ..., a -> 6 *)

val f = a * 2
(* f -> 12 *)
