(*
	Assignmnets for week 1
*)

fun is_older ( date1: (int * int * int), date2 :(int * int* int)) =
    if (#1 date1) < (#1 date2)
        then true
else
    if (#1 date1) > (#1 date2)
		then false
else
    if (#2 date1) < (#2 date2)
        then true
else 
    if (#2 date1) > (#2 date2)
		then false
else 
    if (#3 date1) < (#3 date2)
        then true
else
    false


fun number_in_month(num_month: (int * int * int) list, m : int) =
    if null num_month 
        then 0
    else 
        if (#2 (hd(num_month))) = m
            then 1 + number_in_month(tl(num_month), m)
        else 
			number_in_month(tl(num_month), m)

		
fun number_in_months (num_month: (int * int * int) list , q: int list) =
    if null q
        then 0
    else number_in_month(num_month, hd(q)) + number_in_months(num_month, tl(q))

	
fun dates_in_month (dates_month: (int*int*int) list, m: int) =
    if null dates_month
		then []
    else 
		if (#2 (hd(dates_month))) = m
			then hd(dates_month):: dates_in_month(tl(dates_month),m)
	else 
		dates_in_month(tl(dates_month),m)

	
fun dates_in_months (dates_months: (int * int * int) list , q: int list) =
    if null q
		then []
    else dates_in_month(dates_months, hd(q))@ dates_in_months(dates_months,tl(q))


fun get_nth(str: string list, nth: int) =
    if nth = 1 
		then 
			if null str
				then ""
	else 
		hd(str)
    else 
		get_nth(tl(str), nth - 1)


fun date_to_string (date: (int * int * int)) =
    let val months = 
["January", "February", "March", 
"April", "May","June", 
"July", "August", "September", 
"October", "November", "December"];
	in
		get_nth(months, (#2 date)) ^ " " ^ Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))
	end


fun number_before_reaching_sum (sum: int, list: int list) =
    if sum - hd(list) > 0
		then 1 + number_before_reaching_sum(sum - hd(list), tl(list))
    else 0

	
fun what_month (day: int) =
    let
		val months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
		number_before_reaching_sum(day, months) + 1
    end

	
fun month_range (day1: int, day2: int) =
    if day2 < day1
        then []
    else 
		what_month(day1):: month_range(day1+1,day2);


fun oldest (dates: (int * int * int) list) =
    if null dates
		then NONE
    else let 
	    fun the_oldest (dates: (int * int * int) list) =
			if null (tl dates)
				then hd dates
			else 
				let 
					val tl_ans = the_oldest(tl dates)
				in
					if is_older(hd dates, tl_ans)
						then hd dates
					else 
						tl_ans
				end
	in
	    SOME (the_oldest dates)
	end
