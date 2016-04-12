defmodule MyString do
    def center(words) do
        max_length = Enum.max_by(words, &String.length/1) |> String.length
        for word <- words do
            IO.puts String.rjust(word, String.length(word) + div(max_length - String.length(word), 2))
        end
    end
end
