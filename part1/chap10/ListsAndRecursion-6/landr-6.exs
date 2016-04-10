defmodule MyList do
  def flatten(list) do
    _flatten(list, [])
  end
  defp _flatten([], result) do
    result
  end
  defp _flatten([head | tail], result) when is_list([head | tail]) do
    _flatten(head, _flatten(tail, result))
  end
  defp _flatten(x, result) do
    [x | result]
  end
end