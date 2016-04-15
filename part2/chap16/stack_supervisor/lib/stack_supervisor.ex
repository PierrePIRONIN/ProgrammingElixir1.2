defmodule StackSupervisor do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    {:ok, _pid} = StackSupervisor.Supervisor.start_link(
        Application.get_env(:stack_supervisor, :initial_stack))
  end
end
