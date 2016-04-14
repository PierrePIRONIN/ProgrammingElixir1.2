## Your turn 

### WorkingWithMultipleProcesses-3

Use spawn_link to start a process, and have that process send a message to the parent and then exit immediately. 
Meanwhile, sleep for 500 ms in the parent, then receive as many messages as are waiting. 

Trace what you receive. Does it matter that you weren’t waiting for the notification from the child when it exited?

### WorkingWithMultipleProcesses-4

Do the same, but have the child raise an exception. What difference do you see in the tracing?


## My implementation
```elixir
iex(1)> defmodule TraceSpawn do
...(1)>   def send_parent(parent) do
...(1)>     send parent, "Hello parent"
...(1)> #    exit(:boom) # Exercise 3
...(1)> #    raise "Boom" # Exercise 4
...(1)>     
...(1)>   end
...(1)>   
...(1)>   def receive_messages do
...(1)>     receive do
...(1)>         message -> IO.inspect message
...(1)>         receive_messages
...(1)>     after 1000 ->
...(1)>         IO.puts "Nothing happened as far as I am concerned"
...(1)>     end
...(1)>   end
...(1)>   
...(1)>   def run do
...(1)>     spawn_link(TraceSpawn, :send_parent, [self])
...(1)>     :timer.sleep 500
...(1)>     receive_messages
...(1)>   end
...(1)> end
iex:1: warning: redefining module TraceSpawn
{:module, TraceSpawn,
 <<70, 79, 82, 49, 0, 0, 8, 48, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 224, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:run, 0}}

# Exercise 3
iex(2)> TraceSpawn.run
** (EXIT from #PID<0.57.0>) :boom

# Exercise 4
iex(2)> TraceSpawn.run      
** (EXIT from #PID<0.87.0>) an exception was raised:
    ** (RuntimeError) Boom
        iex:5: TraceSpawn.send_parent/1

```
