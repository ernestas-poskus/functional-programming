(*
   List Functions 
*)


fun sum_list(xs: int list) = 
    if null xs 
    then 0 
    else hd xs + sum_list(tl xs)


fun countdown(x: int) = (* 7 - [7,6,5,4,3,2,1] *)
    if x = 0
    then []
    else x::countdown(x-1)


(* (int list) * (int list) -> int list  *)
fun append (xs: int list, ys: int list) = 
    if null xs
    then ys
    else (hd xs)::append((tl xs), ys)


(* sum_pair_list [(3,4),(5,6)] *)
fun sum_pair_list(xs: (int * int) list) = 
    if null xs 
then 0 
else #1(hd xs) + #2(hd xs) + sum_pair_list(tl xs)


fun firsts(xs: (int * int) list) = (* [3,5] *)
    if null xs 
then []
else (#1 (hd xs))::firsts(tl xs)

fun seconds(xs: (int * int) list) = (* [3,5] *)
    if null xs 
then []
else (#2 (hd xs))::seconds(tl xs)


fun sum_pair_list2(xs: (int * int) list) = 
    (sum_list (firsts xs)) + (sum_list (seconds xs))


(*
    sum_pair_list2 [(3,4), (5,6), (9,~3)]
*)
