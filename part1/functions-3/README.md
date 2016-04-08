## Your turn : Functions-3

The operator rem(a, b) returns the remainder after dividing a by b . Write a
function that takes a single integer ( n ) and calls the function in the previ-
ous exercise, passing it rem(n,3) , rem(n,5) , and n . Call it seven times with
the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13,
14, FizzBuzz, 16.”

=> My implementation
```elixir
iex(1)> fizz_word = fn
...(1)>  0, 0, _ -> "FizzBuzz"
...(1)>  0, _, _ -> "Fizz"
...(1)>  _, 0, _ -> "Buzz"
...(1)>  _, _, a -> a
...(1)> end
#Function<18.54118792/3 in :erl_eval.expr/5>

iex(2)> fizzbuzz = fn n ->
...(2)>    fizz_word.(rem(n, 3), rem(n,5), n)
...(2)> end
#Function<6.54118792/1 in :erl_eval.expr/5>

iex(3)> fizzbuzz.(10)
"Buzz"
iex(4)> fizzbuzz.(11)
11
iex(5)> fizzbuzz.(12)
"Fizz"
iex(6)> fizzbuzz.(13)
13
iex(7)> fizzbuzz.(14)
14
iex(8)> fizzbuzz.(15)
"FizzBuzz"
iex(9)> fizzbuzz.(16)
16

```
