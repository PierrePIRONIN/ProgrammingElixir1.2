defmodule TraceSpawn do
  def send_parent(parent) do
    send parent, "Hello parent"
    exit(:boom) # Exercise 5-a
#    raise "Boom" # Exercise 5-b
  end
  
  def receive_messages do
    receive do
        message -> IO.inspect message
        receive_messages
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
  end
  
  def run do
    spawn_monitor(TraceSpawn, :send_parent, [self])
    :timer.sleep 500
    receive_messages
  end
end
