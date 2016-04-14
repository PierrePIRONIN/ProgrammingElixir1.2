## Your turn : WorkingWithMultipleProcesses-5

Repeat the two, changing spawn_link to spawn_monitor .

## My implementation
```elixir
iex(1)> defmodule TraceSpawn do
...(1)>   def send_parent(parent) do
...(1)>     send parent, "Hello parent"
...(1)>     exit(:boom) # Exercise 5-a
...(1)> #    raise "Boom" # Exercise 5-b
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
...(1)>     spawn_monitor(TraceSpawn, :send_parent, [self])
...(1)>     :timer.sleep 500
...(1)>     receive_messages
...(1)>   end
...(1)> end
{:module, TraceSpawn,
 <<70, 79, 82, 49, 0, 0, 8, 52, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 224, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 4, 104, 2, ...>>,
 {:run, 0}}

# Exercise 5-a
iex(2)> TraceSpawn.run
"Hello parent"
{:DOWN, #Reference<0.0.2.116>, :process, #PID<0.86.0>, :boom}
Nothing happened as far as I am concerned
:ok

# Exercise 5-b
iex(2)> TraceSpawn.run

08:22:57.660 [error] Process #PID<0.86.0> raised an exception
** (RuntimeError) Boom
    iex:5: TraceSpawn.send_parent/1
"Hello parent"
{:DOWN, #Reference<0.0.2.2>, :process, #PID<0.86.0>,
 {%RuntimeError{message: "Boom"},
  [{TraceSpawn, :send_parent, 1, [file: 'iex', line: 5]}]}}
Nothing happened as far as I am concerned
:ok
```
