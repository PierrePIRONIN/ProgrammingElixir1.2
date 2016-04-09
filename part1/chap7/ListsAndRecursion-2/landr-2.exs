defmodule MyList do
 def max([]) do
  nil
 end

 def max([head | tail]) do
   _max(tail, head)
 end

 defp _max([], max) do
   max
 end

 defp _max([head | tail], max) when max >= head do
   _max(tail, max)
 end

 defp _max([head | tail], max) when head >= head do
   _max(tail, head)
 end
end