## Your turn : StringAndBinaries-2

Write an `anagram?(word1, word2)` that returns true if its parameters are anagrams.

## My implementation
```elixir
iex(1)> defmodule MyString do
...(1)>     def anagram?(word1, word2) do
...(1)>       Enum.sort(word1) == Enum.sort(word2)
...(1)>     end
...(1)> end
{:module, MyString,
 <<70, 79, 82, 49, 0, 0, 5, 116, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 170, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:anagram?, 2}}
iex(2)> MyString.anagram?('chien', 'niche')
true
iex(3)> MyString.anagram?('chien', 'chat') 
false

```
