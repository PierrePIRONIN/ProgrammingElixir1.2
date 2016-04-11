defmodule OnlyPrintableChars do
    def test(characters) do
      Enum.all?(characters, &(&1 in ?\s..?~))
    end
end
