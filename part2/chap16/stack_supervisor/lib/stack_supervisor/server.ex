defmodule StackSupervisor.Server do
  use GenServer
  
  #####
  # External API
  def start_link(stash_pid) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, stash_pid, name: __MODULE__)
  end
  
  def pop do
    GenServer.call(__MODULE__, :pop)
  end
  
  def push(element) do
    GenServer.cast(__MODULE__, {:push, element})
  end
  
  #####
  # GenServer implementation
  def init(stash_pid) do
    stack = StackSupervisor.Stash.get_value stash_pid
    {:ok, {stack, stash_pid}}
  end
  
  def handle_call(:pop, _from, {[head | tail], stash_pid}) do
    {:reply, head, {tail, stash_pid}}
  end
    
  def handle_cast({:push, element}, {stack, stash_pid}) do
    {:noreply, {[element | stack], stash_pid}}
  end
  
  def terminate(_reason, {stack, stash_pid}) do
    StackSupervisor.Stash.save_value stash_pid, stack
  end
end