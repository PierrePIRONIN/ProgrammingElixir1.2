defmodule MyEnum do
  def all?(list, fun) do
    _all?(list, fun, true)
  end
  defp _all?([], _fun, result) do
    result
  end
  defp _all?([head | tail], fun, result) do
    _all?(tail, fun, result && fun.(head))
  end

  def each([head | tail], fun) do
    [fun.(head) | each(tail, fun)]
  end
  def each([], _fun) do
    []
  end

  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end
  def filter([], _fun) do
    []
  end
end