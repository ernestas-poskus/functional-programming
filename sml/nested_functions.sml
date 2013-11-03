(*

   - Nested functions using: let

   - Good style to define helper functions inside the functions they help if they are: 
    > Unlikely to be useful elsewhere
    > Likely to be misused if available elsewhere
    > Likely to be changed or removed later

   - Avoid recursion where possible

*)


fun countup_from1(x: int) = 
    let
	fun count(from: int) = 
	    if from = x
	    then x::[]
	    else from::count(from + 1)
    in    
	count(1)
    end
