## Your turn : StringAndBinaries-6

Write a function to capitalize the sentences in a string. Each sentence is terminated by a period and a space. Right now, the case of the characters
in the string is random.
```bash
iex> capitalize_sentences("oh. a DOG. woof. ")
"Oh. A dog. Woof. "
```

## My implementation
```elixir
iex(1)> defmodule MyString do
...(1)>     def capitalize_sentences(sentences) do
...(1)>       String.split(sentences, ". ")
...(1)>       |> capitalize_words
...(1)>       |> Enum.join(". ")
...(1)>     end
...(1)> 
...(1)>     defp capitalize_words(words) do
...(1)>       for word <- words do
...(1)>         String.capitalize(word)
...(1)>       end
...(1)>     end
...(1)> end
iex:1: warning: redefining module MyString
{:module, MyString,
 <<70, 79, 82, 49, 0, 0, 7, 96, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 169, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:capitalize_words, 1}}
iex(2)> MyString.capitalize_sentences("oh. a DOG. woof. ")
"Oh. A dog. Woof. "
```
