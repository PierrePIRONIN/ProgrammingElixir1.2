## Your turn : ListsAndRecursions-2

Write a max(list) that returns the element with the maximum value in the
list. (This is slightly trickier than it sounds.)

=> My implementation
```elixir
iex(1)> defmodule MyList do
...(1)>  def max([]) do
...(1)>   nil
...(1)>  end
...(1)> 
...(1)>  def max([head | tail]) do
...(1)>    _max(tail, head)
...(1)>  end
...(1)> 
...(1)>  defp _max([], max) do
...(1)>    max
...(1)>  end
...(1)> 
...(1)>  defp _max([head | tail], max) when max >= head do
...(1)>    _max(tail, max)
...(1)>  end
...(1)> 
...(1)>  defp _max([head | tail], max) when head >= head do
...(1)>    _max(tail, head)
...(1)>  end
...(1)> end
iex:18: warning: variable max is unused
{:module, MyList,
 <<70, 79, 82, 49, 0, 0, 5, 132, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 150, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:_max, 2}}
iex(2)> MyList.max [1,2,3,7,4,10,5]
10
```
