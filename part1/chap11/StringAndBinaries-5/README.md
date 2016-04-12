## Your turn : StringAndBinaries-5

Write a function that takes a list of dqs and prints each on a separate line, centered in a column that has the width of the longest string. Make
sure it works with UTF characters.
```bash
iex> center(["cat", "zebra", "elephant"])
  cat
 zebra
elephant
```
## My implementation
```elixir
iex(1)> defmodule MyString do
...(1)>     def center(words) do
...(1)>         max_length = Enum.max_by(words, &String.length/1) |> String.length
...(1)>         for word <- words do
...(1)>             IO.puts String.rjust(word, String.length(word) + div(max_length - String.length(word), 2))
...(1)>         end
...(1)>     end
...(1)> end
{:module, MyString,
 <<70, 79, 82, 49, 0, 0, 7, 152, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 151, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:center, 1}}

iex(2)> MyString.center(["cat", "zebra", "elephant"])
  cat
 zebra
elephant
[:ok, :ok, :ok]
```
