(*

 Lists

 - Empty list []

 - [v1, v2, ..., vn]

 - All list elements must have the same type
   - [true, false, true]
   - val x = [3, 4, 9+10]

 - Cons - constructs lists / concatenate to list
   - e1::e2
   - 6::88::x; -> [6, 88, 3, 4, 19] : int list
   - [6]::x - error

 - Checking list
   - null x -> false : bool
   - null [] -> true : bool
   - hd x; = head of list
   - tl x; = tail of list 

 - Accessing list 
   - hd / tl
   - val x = [5, 1, 6, 8] - access 3rd elememnt 6: 
     > val el = hd( tl(tl x)) 



*)
