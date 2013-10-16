datatype mytype = TwoInts of int * int
		| Str of string
		| Pizza

(*
    mytype -> int 
*)
fun f (x: mytype) =
      case x of
	  Pizza => 3
        | Str s => 8
        | TwoInts(i1, i2) => i1 + i2  

(*
f Pizza; -> 3
f (Str "hu") -> 8 
f (TwoInts(7,9)) -> 16
*)
