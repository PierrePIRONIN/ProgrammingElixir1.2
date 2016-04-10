## Your turn : ListsAndRecursions-1

Write a `mapsum` function that takes a list and a function. It applies the function to each element of the list and then sums the result.

## My implementation
```elixir
iex(1)> defmodule MyList  do
...(1)>   def mapsum([head | tail], func) do
...(1)>     _map([head | tail], func)
...(1)>     |> _sum(0)
...(1)>   end
...(1)> 
...(1)>   defp _map([], _func) do
...(1)>     []
...(1)>   end
...(1)> 
...(1)>   defp _map([head | tail], func) do
...(1)>     [func.(head) | _map(tail, func)]
...(1)>   end
...(1)> 
...(1)>   defp _sum([], value) do
...(1)>    value
...(1)>   end
...(1)> 
...(1)>   defp _sum([head | tail], value) do
...(1)>     _sum(tail, head + value)
...(1)>   end
...(1)> end
{:module, MyList,
 <<70, 79, 82, 49, 0, 0, 6, 40, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 169, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:_sum, 2}}
 
iex(2)> MyList.mapsum [1,2,3], &(&1 * &1)
14
```
