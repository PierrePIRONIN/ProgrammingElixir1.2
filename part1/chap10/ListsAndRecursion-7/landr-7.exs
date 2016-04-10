defmodule MyList do
  def span(from, to) do
    _span(from, to, [])
  end
  def _span(from, to, result) when to < from do
     result
  end
  def _span(from, to, result) when to >= from do
    _span(from, to - 1, [to | result])
  end

  def is_prime(x) do
    Enum.all?(span(2, x-1), &(rem(x, &1) != 0))
  end

  def primeNumbers(n) do
    for x <- span(2,n), is_prime(x), do: x
  end
end