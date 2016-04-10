## Your turn : ListsAndRecursions-4

Write a function `MyList.span(from, to)` that returns a list of the numbers from `from` up to `to` .

## My implementation
```elixir
iex(1)> defmodule MyList do
...(1)>   def span(from, to) do
...(1)>     _span(from, to, [])
...(1)>   end
...(1)> 
...(1)>   def _span(from, to, result) when to < from do
...(1)>      result
...(1)>   end
...(1)> 
...(1)>   def _span(from, to, result) when to >= from do
...(1)>     _span(from, to - 1, [to | result])
...(1)>   end
...(1)> end
{:module, MyList,
 <<70, 79, 82, 49, 0, 0, 5, 228, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 244, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:_span, 3}}
 
iex(2)> MyList.span(5, 15)
[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
```
