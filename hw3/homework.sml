(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)



(* Ex: 1 *)
fun only_capitals lst = List.filter(fn str => Char.isUpper(String.sub(str,0))) lst

(* Ex: 2 *)
fun longest_string1 lst = List.foldl (fn (x,y) => if String.size(x) > String.size(y) then x else y ) "" lst

(* Ex: 3 *)
fun longest_string2 lst = List.foldl (fn (x,y) => if String.size(x) >= String.size(y) then x else y ) "" lst

(* Ex: 4 *)
fun longest_string_helper f lst =
    List.foldl (fn (x,y) => if f(String.size(x), String.size(y)) then x else y) "" lst

fun longest_string3 lst = 
    longest_string_helper (fn (x,y) => if x > y then true else false) lst

fun longest_string4 lst =
    longest_string_helper (fn (x,y) => if x >= y then true else false) lst
	
(* Ex: 5 *)
val longest_capitalized = fn lst => (longest_string1 o only_capitals) lst

(* Ex: 6 *)
fun rev_string str = (String.implode o (rev o String.explode)) str

(* Ex: 7 *)
fun first_answer f lst =
 case lst of
    [] => raise NoAnswer
	| x::x' => case f x of
					SOME y =>  y
					|  NONE => first_answer f x' 

(* Ex: 8 *)
fun all_answers f lst  =
 let fun aux f (lst, acc)  =
         case lst of
             [] => SOME acc
           | x::x' => case f x of
                          SOME y => aux f (x',  acc @ y)
                        | NONE => NONE 
in
    aux f (lst, [])
end

(* Ex: 9 *)
fun count_wildcards pattern = g (fn () => 1) (fn x => 0) pattern

fun count_wild_and_variable_lengths pattern = g (fn () => 1) (fn x => String.size x) pattern

fun count_some_var (str, pattern) = g(fn() => 0) (fn x => if str = x then 1 else 0) pattern 

(* Ex: 10 *)
fun check_pat pattern = 
    let
        fun aux1 (pattern, acc) =
            case pattern of
                Variable v => v::acc
                | TupleP tp => (List.foldl(fn (p,i) => aux1(p,i)) acc tp) @ acc
                | ConstructorP(_,p) => aux1(p, acc)
                | _ => acc
        fun aux2 lst =
            case lst of
				[] => true
				| x::x' => if List.exists(fn y => y=x) x' then false else aux2 x'
    in
        (aux2 o aux1)(pattern, [])
    end

(* Ex: 11 *)
fun match (valu, pattern) =
case (valu,pattern) of
		(_, Variable v) => SOME [(v, valu)]
		| (_, Wildcard) => SOME []
		| (Const x, ConstP p) => if x=p then SOME [] else NONE 
		| (Tuple ss, TupleP ps) => if List.length(ss)=List.length(ps) then 
       all_answers match (ListPair.zip(ss, ps)) else NONE
		|  (Constructor (c,cc), ConstructorP(p,pp)) => if c=p then match (cc,pp) else NONE
		| (Unit, UnitP) => SOME []
		|  _  => NONE

(* Ex: 12 *)
fun first_match value pattern =
    case pattern of
        [] => NONE
      | x::x' => if match (value, x) = NONE then first_match value x' else match (value, x)

(* *********************************************************************** *)	  
datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)