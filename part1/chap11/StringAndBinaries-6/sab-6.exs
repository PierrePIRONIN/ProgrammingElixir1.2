defmodule MyString do
    def capitalize_sentences(sentences) do
      String.split(sentences, ". ")
      |> capitalize_words
      |> Enum.join(". ")
    end

    defp capitalize_words(words) do
      for word <- words do
        String.capitalize(word)
      end
    end
end
