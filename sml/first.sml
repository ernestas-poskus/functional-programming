(* This is comment *)

(* This is my first ML program *)

val x = 34; 
(* static environment x: int *)
(* dynamic environment x --> 34 *)

val y = 17;

val z = (x+y) + (y+2)
(* static environment x: int, y: int, z:int  *)
(* dynamic environment x --> 34, y --> 17, z --> 70 *)

val q = z + 1

val abs_of_z = if z < 0 then 0 - z else z; (* bool *) (* int *)
(* static environment int  *)
(* dynamic environment: ..., abs_of_z --> 70 *)

val abs_of_z_simpler = abs z;
(* parenthesis does not matter  *)

