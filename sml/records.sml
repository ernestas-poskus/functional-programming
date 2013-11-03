(*

	# Records
	
	Record values have fields (any name) holding values
		{f1 = v1, …, fn = vn}

	Record types have fields (and name) holding types
		{f1 : t1, …, fn : tn}

	The order of fields in a record value or type never matters
		REPL alphabetizes fields just for consistency
		
	Building records:
		{f1 = e1, …, fn = en}
		
	Accessing pieces:
		#myfieldname e

*)

val x = {bar = (1+2, true andalso true), foo = 3+4, baz = (false, 9) };


val my_niece = {name="Amelia", id = 41123 - 12 };

#id my_niece -> val it = 41111 : int

