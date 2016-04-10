## Your turn : ListsAndRecursions-7

In the last exercise of Chapter 7, Lists and Recursion, on page 65, you wrote a `span` function. 

Use it and list comprehensions to return a list of the prime numbers from 2 to n.

## My implementation
```elixir
iex(1)> defmodule MyList do
...(1)>   def span(from, to) do
...(1)>     _span(from, to, [])
...(1)>   end
...(1)>   def _span(from, to, result) when to < from do
...(1)>      result
...(1)>   end
...(1)>   def _span(from, to, result) when to >= from do
...(1)>     _span(from, to - 1, [to | result])
...(1)>   end
...(1)> 
...(1)>   def is_prime(x) do
...(1)>     Enum.all?(span(2, x-1), &(rem(x, &1) != 0))
...(1)>   end
...(1)> 
...(1)>   def primeNumbers(n) do
...(1)>     for x <- span(2,n), is_prime(x), do: x
...(1)>   end
...(1)> end
iex:1: warning: redefining module MyList
{:module, MyList,
 <<70, 79, 82, 49, 0, 0, 9, 164, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 1, 92, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:primeNumbers, 1}}
 
iex(2)> MyList.primeNumbers(30)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
```
