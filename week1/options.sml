(*

  Options

  - t option is a type for any type t (much like t list, but a different type, not a list)

  Building:

  - NONE has type 'a option (much liek [] has type 'a list)
  - SOME e has type t option if e has type t (much like e::[])


  Accessing:
 
  - isSome has type 'a option -> bool
  - valOf has type 'a option -> 'a (exception if given NONE)

*)

(* fn: int list -> int option *)
fun max1(xs: int list) = 
    if null xs
    then NONE
else
    let val tl_ans = max1(tl xs)
    in if isSome tl_ans and also valof tl_ans > hd xs
       then tl_ans
       else SOME(hd xs)
end
