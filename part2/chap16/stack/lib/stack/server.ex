defmodule Stack.Server do

  use GenServer

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
  
  def handle_cast({:push, element}, stack) do
    {:noreply, [element | stack]}
  end
end