## Your turn : Functions-1

Go into iex. Create and run the functions that do the following:
– list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
– sum.(1, 2, 3) #=> 6
– pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]

=> My implementation
```elixir
iex(1)> list_concat = fn list1, list2 -> list1 ++ list2 end
#Function<12.54118792/2 in :erl_eval.expr/5>
iex(2)> list_concat.([:a, :b], [:c,:d])
[:a, :b, :c, :d]

iex(3)> sum = fn a, b, c -> a + b + c end
#Function<18.54118792/3 in :erl_eval.expr/5>
iex(4)> sum.(1, 2, 3)
6

iex(5)> pair_tuple_to_list = fn {a, b} -> [a, b] end
#Function<6.54118792/1 in :erl_eval.expr/5>
iex(6)> pair_tuple_to_list.({1234, 5678})
[1234, 5678]
```
