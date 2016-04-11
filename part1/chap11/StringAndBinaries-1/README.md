## Your turn : StringAndBinaries-1

Write a function that returns true if a single-quoted string contains only printable ASCII characters (space through tilde).

## My implementation
```elixir
iex(1)> defmodule OnlyPrintableChars do
...(1)>     def test(characters) do
...(1)>       Enum.all?(characters, &(&1 in ?\s..?~))
...(1)>     end
...(1)> end
{:module, OnlyPrintableChars,
 <<70, 79, 82, 49, 0, 0, 6, 12, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 154, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:test, 1}}
iex(2)> OnlyPrintableChars.test('essai')
true
iex(3)> OnlyPrintableChars.test('∂x/∂y')
false
```
