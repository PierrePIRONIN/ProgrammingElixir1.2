## Your turn : Functions-2

Write a function that takes three arguments. If the first two are zero, return “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero, return “Buzz.” Otherwise return the third argument.    
Do not use any language features that we haven’t yet covered in this book.

## My implementation
```elixir
iex(1)> fizz_word = fn
...(1)>  0, 0, _ -> "FizzBuzz"
...(1)>  0, _, _ -> "Fizz"
...(1)>  _, 0, _ -> "Buzz"
...(1)>  _, _, a -> a
...(1)> end
#Function<18.54118792/3 in :erl_eval.expr/5>

iex(2)> fizz_word.(0,0,0)
"FizzBuzz"
iex(3)> fizz_word.(0,4,5)
"Fizz"
iex(4)> fizz_word.(4,0,5)
"Buzz"
iex(5)> fizz_word.(4,5,6)
6
```
