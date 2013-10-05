

fun swap(pair: int * bool) = 
    (#2 pair, #1 pair)


(* (int * int) * (int * int) -> int *)
fun sum_two_pairs(pr1: int * int, pr2: int * int ) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2)

(* int * int -> int * int  *)
fun div_mod(x: int, y: int) = 
    (x div y, x mod y)


fun sort_pair(pr: int * int) = 
    if(#1 pr) < (#2 pr)
    then pr
    else (#2 pr, #1pr)


(*
swap(7, true)
swap(false, ~4)

sort_pair(3,4)

*)


(* Tuples: *)
val x = (3, (4, (5,6)))
val y = (#2 x, (#1 x, #2 (#2 x)))
val ans = ((3, (5,6)), 4)
