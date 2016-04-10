## Your turn : ListsAndRecursion-6
**(Hard)** Write a `flatten(list)` function that takes a list that may contain any number of sublists, which themselves may contain sublists, to any depth.

It returns the elements of these lists as a flat list.
```elixir
iex> MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
[1,2,3,4,5,6]
```
Hint: You may have to use Enum.reverse to get your result in the correct order.

## My implementation
```elixir
iex(1)> defmodule MyList do
...(1)>   def flatten(list) do
...(1)>     _flatten(list, [])
...(1)>   end
...(1)>   defp _flatten([], result) do
...(1)>     result
...(1)>   end
...(1)>   defp _flatten([head | tail], result) when is_list([head | tail]) do
...(1)>     _flatten(head, _flatten(tail, result))
...(1)>   end
...(1)>   defp _flatten(x, result) do
...(1)>     [x | result]
...(1)>   end
...(1)> end
{:module, MyList,
 <<70, 79, 82, 49, 0, 0, 5, 140, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 151, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:_flatten, 2}}
 
iex(2)> MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
[1, 2, 3, 4, 5, 6]
```
