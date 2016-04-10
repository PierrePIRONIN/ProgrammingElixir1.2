## Your turn : ListsAndRecursions-5

Implement the following Enum functions using no library functions or list comprehensions: `all?`, `each`, `filter`, `split`, and `take`. 
You may need to use an if statement to implement filter. The syntax for this is 
```
if condition do
  expression(s)
else
  expression(s)
end
```

## My implementation
```elixir
iex(1)> defmodule MyEnum do
...(1)>   def all?(list, fun) do
...(1)>     _all?(list, fun, true)
...(1)>   end
...(1)>   defp _all?([], _fun, result) do
...(1)>     result
...(1)>   end
...(1)>   defp _all?([head | tail], fun, result) do
...(1)>     _all?(tail, fun, result && fun.(head))
...(1)>   end
...(1)> 
...(1)>   def each([head | tail], fun) do
...(1)>     [fun.(head) | each(tail, fun)]
...(1)>   end
...(1)>   def each([], _fun) do
...(1)>     []
...(1)>   end
...(1)> 
...(1)>   def filter([head | tail], fun) do
...(1)>     if fun.(head) do
...(1)>       [head | filter(tail, fun)]
...(1)>     else
...(1)>       filter(tail, fun)
...(1)>     end
...(1)>   end
...(1)>   def filter([], _fun) do
...(1)>     []
...(1)>   end
...(1)> end
{:module, MyEnum,
 <<70, 79, 82, 49, 0, 0, 7, 252, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 1, 43, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:filter, 2}}
 
iex(2)> MyEnum.all?([1,2,3,4,5], &(&1 < 4))        
false

iex(3)> MyEnum.each([1,2,3,4,5], &(&1 + 1))
[2, 3, 4, 5, 6]

iex(4)> MyEnum.filter([1,2,3,4,5], &(&1 < 4))
[1, 2, 3]
```
