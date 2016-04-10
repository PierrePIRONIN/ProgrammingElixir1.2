## Your turn

### Exercise: ModulesAndFunctions-4
Implement and run a function `sum(n)` that uses recursion to calculate the sum of the integers from 1 to n. You’ll need to write this function inside a module in a separate file. Then load up iex, compile that file, and try your function.

### Exercise: ModulesAndFunctions-5
Write a function `gcd(x,y)` that finds the greatest common divisor between two nonnegative integers. Algebraically, `gcd(x,y)` is x if y is zero; it’s `gcd(y,rem(x,y))` otherwise.

=> My implementation
```elixir
iex(1)> defmodule Sum do
...(1)>   def of(0), do: 0
...(1)>   def of(n), do: n + of(n-1)
...(1)> end
{:module, Sum,
 <<70, 79, 82, 49, 0, 0, 5, 44, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 143, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:of, 1}}
 
iex(2)> Sum.of(6)
21

iex(3)> defmodule Gcd do
...(3)>   def of(x, 0), do: x
...(3)>   def of(x, y), do: of(y, rem(x, y))
...(3)> end
{:module, Gcd,
 <<70, 79, 82, 49, 0, 0, 5, 32, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 156, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:of, 2}}
 
iex(4)> Gcd.of(12, 18)
6
```
