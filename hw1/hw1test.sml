(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1 = is_older((1,2,3),(2,3,4)) = true (* true *)
val test11 = is_older((1,2,3),(1,2,3)) = false (* false  - equal *)
val test12 = is_older((1,2,3),(2,2,3)) = true 
val test13 = is_older((1,2,3),(1,3,3)) = true 
val test14 = is_older((1,2,3),(1,2,4)) = true
val test15 = is_older((2,2,3),(1,2,3)) = false
val test16 = is_older((1,3,3),(1,2,3)) = false
val test17 = is_older((1,2,4),(1,2,3)) = false



val test2 = number_in_month([(2012,2,28),(2013,12,1)], 2) = 1
val test21 = number_in_month([(2012,2,28)], 2) = 1 
val test22 = number_in_month([(2012,2,28), (2012,4,30), (2012,4,30), (2012,4,30), (2012,4,30), (2012,4,30)], 4) = 5 
val test23 = number_in_month([(2005,2,28),(2013,12,1),(2013,2,1)], 12) = 1



val test3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test31 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val test32 = number_in_months([(2012,2,28),(2013,2,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 4
val test33 = number_in_months([(2002,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test34 = number_in_months([(2012,2,28),(2013,3,1),(2011,3,31),(2011,6,28)],[11,12]) = 0
val test35 = number_in_months([(2013,2,28)],[2,3,4]) = 1
val test36 = number_in_months([(2011,2,28),(2013,12,1),(2011,3,31),(2011,4,28),(2011,4,28),(2011,4,28),(2011,4,28),(2011,4,28),(2011,4,28),(2011,4,28)],[2,3,4]) = 9



val test4 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test41 = dates_in_month([(2012,2,28),(2013,12,1)],3) = []
val test42 = dates_in_month([(2012,2,28),(2013,12,1), (2012,1,13), (2013,7,1), (2013,3,1)], 2) = [(2012,2,28)]
val test43 = dates_in_month([(2012,2,28),(2013,12,1),(2013,12,1),(2013,12,1),(2013,12,1)], 12) = [(2013,12,1),(2013,12,1),(2013,12,1),(2013,12,1)]
val test44 = dates_in_month([(2012,2,28)],3) = []
val test45 = dates_in_month([(2012,2,28),(201222222,2111,1)], 2111) = [(201222222,2111,1)]



val test5 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test51 = dates_in_months([(2011,4,28)],[2,3,4]) = [(2011,4,28)]
val test52 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = [(2012,2,28),(2011,3,31)]
val test53 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4]) = [(2011,4,28)]
val test54 = dates_in_months([(2012,2,28),(2013,1,1),(2011,11,31),(2011,1,28)],[3,11,2,1]) = [(2011,11,31),(2012,2,28),(2013,1,1),(2011,1,28)]
val test55 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test56 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[11]) = []



val test6 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test61 = get_nth(["hi", "there", "how", "same", "you"], 5) = "you"
val test62 = get_nth(["are", "you"], 1) = "are"
val test63 = get_nth(["hi", "there", "how", "course", "you"], 4) = "course"
val test64 = get_nth(["sml", "why", "how", "are", "you"], 1) = "sml"
val test65 = get_nth(["hi", "there", "oh my", "are", "you"], 4) = "are"
val test66 = get_nth(["hi", "there", "how", "are", ""], 5) = ""



val test7 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test71 = date_to_string((2013, 2, 15)) = "February 15, 2013"
val test72 = date_to_string((1222, 3, 1)) = "March 1, 1222"
val test73 = date_to_string((2013, 1, 11)) = "January 11, 2013"
val test74 = date_to_string((2033, 5, 1)) = "May 1, 2033"
val test75 = date_to_string((2013, 7, 2)) = "July 2, 2013"
val test76 = date_to_string((2013, 12, 31)) = "December 31, 2013"
val test77 = date_to_string((1223, 6, 1)) = "June 1, 1223"
val test78 = date_to_string((263, 8, 13)) = "August 13, 263"
val test79 = date_to_string((2999, 9, 21)) = "September 21, 2999"



val test8 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3 
val test81 = number_before_reaching_sum(36, [1,2,3,4,5,6,7,8,9,10,11,12,13,15,16]) = 7 
val test82 = number_before_reaching_sum(20, [1,2,3,4,5,6,7,8,9,10,11,12,13,15,16]) = 5 
val test83 = number_before_reaching_sum(70, [1,2,3,4,5,6,7,8,9,10,11,12,13,15,16]) = 11 
val test84 = number_before_reaching_sum(40, [1,2,3,4,5,6,7,8,9,10,11,12,13,15,16]) = 8
val test85 = number_before_reaching_sum(23, [1,2,3,4,5,6,7,8,9,10,11,12,13,15,16]) = 6 
val test86 = number_before_reaching_sum(1, [1,2,3,4,5,6,7,8,9,10,11,12,13,15,16]) = 0



val test9 = what_month(70) = 3
val test91 = what_month(140) = 5
val test92 = what_month(50) = 2
val test93 = what_month(10) = 1
val test94 = what_month(360) = 12
val test95 = what_month(120) = 4
val test96 = what_month(13) = 1
val test97 = what_month(270) = 9
val test98 = what_month(189) = 7



val test10 = month_range(31, 34) = [1,2,2,2]
val test101 = month_range(12, 16) = [1,1,1,1,1]
val test102 = month_range(28, 31) = [1,1,1,1]



val test110 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test111 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test112 = oldest([(2012,2,28),(2011,3,31)]) = SOME (2011,3,31)
val test113 = oldest([]) = NONE 
val test114 = oldest([(2012,2,28),(2011,3,31),(2011,3,31),(2011,3,31),(2011,3,31),(1111,4,13)]) = SOME (1111,4,13)
val test115 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test116 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test117 = oldest([(13,2,13),(2011,3,31),(2011,4,28)]) = SOME (13,2,13)
val test118 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)





