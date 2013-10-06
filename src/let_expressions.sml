(*

    Let Expressions 

    Scope Bindings
     - local function variables
     - variables only affects same function where invoked

*)

fun letfunc(z: int) = 
    let
	val x = if z > 0 then z else 34		 
	val y = x + z + 9
    in
	if x > 0 then x * 2 else y  * y
    end

fun letfunc2() = 
    let 
	val x = 1
    in
	(let val x = 2 in x + 1 end) + (let val y = x + 2 in y + 1 end)
    end 
