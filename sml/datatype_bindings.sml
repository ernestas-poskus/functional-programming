(*

	# Datatype bindings
	
	A “strange” (?) and totally awesome (!) way to make one-of types: 
	– A datatype binding 
	
		datatype mytype = TwoInts of int * int 
						| Str of string 
						| Pizza 
	
	• Adds a new type mytype to the environment 
	• Adds constructors to the environment: TwoInts, Str, and Pizza 
	• A constructor is (among other things), a function that makes 
	values of the new type (or is a value of the new type): 
	– TwoInts : int * int -> mytype 
	– Str : string -> mytype 
	– Pizza : mytype 
	
	
*)


(*
	Constructor 
*)
datatype mytype = TwoInts of int * int 
				| Str of string 
				| Pizza 

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(1+2, 3+4)
val e = a 
