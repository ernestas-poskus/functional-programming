(*
   REPL - Read Evaluate Print Loop

   ctrl + c / ctrl + s

*)


(* Program with errors *)

val x = 34 

val y = x + 1

val z = if y > 0 then 34 else y

val q = if y > 0 then 0 else 42 (* else 42 *)

val a = ~5 (* tilde is negation in ML *) 

val w = 0
 
val funny = 34

val v = x div (w + 1) (* there is no / division operator in ML only 'div' *)

val fourteen = 7 + 7 
