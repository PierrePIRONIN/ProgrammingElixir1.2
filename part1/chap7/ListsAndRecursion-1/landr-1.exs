defmodule MyList  do
  def mapsum([head | tail], func) do
    _map([head | tail], func)
    |> _sum(0)
  end

  defp _map([], _func) do
    []
  end

  defp _map([head | tail], func) do
    [func.(head) | _map(tail, func)]
  end

  defp _sum([], value) do
   value
  end

  defp _sum([head | tail], value) do
    _sum(tail, head + value)
  end
end