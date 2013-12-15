(*
	Assignmnets for week 2
*)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2
	
(* put your solutions for problem 1 here *)	
	
(* (a) *)	
 fun all_except_option (s : string, lst : string list) =	
	case lst of 	
		[] => NONE	
		| x::x' => if same_string(x, s) then	
			SOME x'	
	else	
		case all_except_option(s, x') of	
			NONE => NONE	
		  | SOME y=> SOME (x::y)  		
	
(* (b) *)
fun get_substitutions1 (lst : string list list, s : string) = 	
	case lst of	
		[] => []	
		| x::x' => case all_except_option(s, x) of	
                   NONE => get_substitutions1(x', s)	
                 | SOME y => y @ get_substitutions1(x', s)	

(* (c) *)
fun get_substitutions2 (lst : string list list, s : string) =
	let fun aux (lst :string list list, s :string, lst2 : string list)=	
	case lst of	
		[]=> lst2	
		| x::x' => case all_except_option(s,x) of 	
                   NONE => aux(x', s, lst2)
                 | SOME y => aux(x', s, lst2 @ y)	
	in	    
		aux(lst, s, [])	
	end

(* (d) *)
fun similar_names (lst : string list list, name : {first : string, middle : string , last : string }) =
    let fun aux(first,middle,last, acc ) =
	    case first of
		[] => acc
		| x::xs  => aux(xs,middle,last, {first=x, middle=middle, last=last} :: acc)
    in
	case name of
	    {first, middle, last} => aux(get_substitutions2(lst, first) @ [first], middle, last, [])
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove


(* put your solutions for problem 2 here *)


fun card_color (c : card) =
    case  c of
		(Clubs,_) => Black
		|  (Spades,_) => Black
		| _ => Red

(* (b) *)
fun card_value (c:card) =
    case c of
		(_,Ace) => 11
		| (_,Num i) => i
		| _ => 10 
    
(* (c) *)

fun remove_card (cs: card list, c: card, e: exn) = 
    case cs of
		[] => raise e
        | x::x' => case x = c of
		true => x'
		| false => x::remove_card(x',c,e) 



(* (d) *)

fun all_same_color (cs: card list) =
    let fun aux (cs: card list, col:color) =
	case cs of
	    [] => true
	    |  x::xs => case col = card_color(x) of
			    true => aux(xs,col)
			    | false =>false 
    in
	case cs of
		[] => true
	    | x::xs => aux(xs, card_color(x))
    end		  



(* (e) *)
fun sum_cards (cs: card list) =
let fun sum(cs, acc) =
	case cs of
	    [] => acc
		| i::xs' => sum(xs',card_value(i)+acc) 
in
    sum(cs,0)
end

(* (f) *)

fun score (cs: card list, goal: int) =
    let fun preliminary_score(value: int, goal: int) =
	case value > goal of
		true => 3 * (value - goal)
		| false => goal - value
	fun final_score(cs: card list, goal: int) =
	    case all_same_color cs of
		true => goal div 2
		| false => goal
    in
		final_score(cs, preliminary_score(sum_cards(cs), goal))
    end

(* (g) *)

fun officiate (cs: card list, mov: move list, goal: int) =
    let fun loop (cs:card list, mov: move list, goal: int, result : card list)=
	case (cs,mov,goal,result) of
	    (_,[],goal,result) => score(result,goal)
	    | ([],Draw::m',goal,result) => score(result, goal)
	    | (cs,Discard m::m',goal,result) => loop(cs,m',goal,remove_card(result,m, IllegalMove))
	    | (c::c', Draw::m',goal,result) => case (card_value(c) + sum_cards(result)) > goal of
						  true => score(c::result, goal)
						| false => loop(c',m',goal,c::result) 
    in
	case (cs,mov,goal) of
	    (cs,mov,goal) => loop(cs,mov,goal,[])
    end

fun provided_test1 () = (* correct behavior: raise IllegalMove *)
    let val cards = [(Clubs,Jack),(Spades,Num(8))]
		val moves = [Draw,Discard(Hearts,Jack)]
    in
		officiate(cards,moves,42)
    end

fun provided_test2 () = (* correct behavior: return 3 *)
    let val cards = [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)]
		val moves = [Draw,Draw,Draw,Draw,Draw]
    in
		officiate(cards,moves,42)
    end


	
	
	


















