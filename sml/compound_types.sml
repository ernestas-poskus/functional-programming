(*

	# Building Compound types
	
	• Tuples build each-of types
		– int * bool contains an int and a bool
	• Options build one-of types
		– int option contains an int or it contains no data
	• Lists use all three building blocks
		– int list contains an int and another int list or it 
		contains no data
	• And of course we can nest compound types
		– ((int * int) option) * (int list list)) option

		
	• Another way to build each-of types in ML
		– Records: have named fields
		– Connection to tuples and idea of syntactic sugar
	• A way to build and use our own one-of types in ML
		– For example, a type that contains an int or a string
		– Will lead to pattern-matching, one of ML’s coolest and 
		strangest-to-Java-programmers features
	• How OOP does one-of types
		– Key contrast with procedural and functional programming
*)