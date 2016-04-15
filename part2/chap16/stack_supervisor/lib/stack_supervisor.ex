defmodule StackSupervisor do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    {:ok, _pid} = StackSupervisor.Supervisor.start_link([5, "cat", 9])
  end
end
