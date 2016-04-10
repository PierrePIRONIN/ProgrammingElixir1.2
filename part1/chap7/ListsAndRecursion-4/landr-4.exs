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
end