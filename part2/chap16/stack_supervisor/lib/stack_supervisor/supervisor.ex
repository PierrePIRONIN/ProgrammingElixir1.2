defmodule StackSupervisor.Supervisor do
    use Supervisor
    
    def start_link(initial_stack) do
        result = {:ok, sup } = Supervisor.start_link(__MODULE__, [initial_stack])
        start_workers(sup, initial_stack)
        result
    end
    
    def start_workers(sup, initial_stack) do
        # Start the stash worker
        {:ok, stash} =
        Supervisor.start_child(sup, worker(StackSupervisor.Stash, [initial_stack]))
        # and then the subsupervisor for the actual sequence server
        Supervisor.start_child(sup, supervisor(StackSupervisor.SubSupervisor, [stash]))
    end
    
    def init(_) do
        supervise [], strategy: :one_for_one
    end
end