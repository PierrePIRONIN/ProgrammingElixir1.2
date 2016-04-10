## Your turn

### Exercise: ModulesAndFunctions-1
Extend the Times module with a triple function that multiplies its parameter
by three.
### Exercise: ModulesAndFunctions-2
Run the result in iex. Use both techniques to compile the file.
### Exercise: ModulesAndFunctions-3
Add a quadruple function. (Maybe it could call the double function....)

=> My implementation
```elixir
iex(1)> defmodule Times do
...(1)>   def double(n), do: n * 2
...(1)>   def triple(n), do: n * 3
...(1)>   def quadruple(n), do: double(double(n))
...(1)> end
{:module, Times,
 <<70, 79, 82, 49, 0, 0, 6, 12, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 246, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:quadruple, 1}}
 
iex(2)> Times.double(2)
4
iex(3)> Times.triple(2)
6
iex(4)> Times.quadruple(2)
8

```
