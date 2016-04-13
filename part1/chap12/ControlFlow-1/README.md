## Your turn : ControlFlow-1

Rewrite the FizzBuzz example using case.

## My implementation
```elixir
iex(1)> defmodule FizzBuzz do
...(1)>     def run(n) do
...(1)>       1..n |> Enum.map(&apply/1)
...(1)>     end
...(1)> 
...(1)>     defp apply(n) do
...(1)>       case {rem(n, 3), rem(n,5)} do
...(1)>         {0,0} -> "FizzBuzz"
...(1)>         {0,_} -> "Fizz"
...(1)>         {_,0} -> "Buzz"
...(1)>         {_,_} -> n
...(1)>       end
...(1)>     end
...(1)> end
iex:1: warning: redefining module FizzBuzz
{:module, FizzBuzz,
 <<70, 79, 82, 49, 0, 0, 6, 192, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 144, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:apply, 1}}
 
iex(2)> FizzBuzz.run(20)
[1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14,
 "FizzBuzz", 16, 17, "Fizz", 19, "Buzz"]
```
