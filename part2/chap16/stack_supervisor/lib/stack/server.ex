defmodule Stack.Server do

  use GenServer
  
  #####
  # External API
  
  def start_link(stack) do
    GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end
  
  def pop do
    GenServer.call(__MODULE__, :pop)
  end
  
  def push(element) do
    GenServer.cast(__MODULE__, {:push, element})
  end
  
  #####
  # GenServer implementation
  
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
    
  def handle_cast({:push, element}, stack) do
    {:noreply, [element | stack]}
  end
end