defmodule Euler do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Euler.Repo, []),
      # Start the endpoint when the application starts
      supervisor(Euler.Endpoint, []),
      # Start your own worker by calling: Euler.Worker.start_link(arg1, arg2, arg3)
      # worker(Euler.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Euler.Supervisor]
    start = Supervisor.start_link(children, opts)
    Euler.Repo.delete_all Euler.Problem
    File.read!("./data/solutions.txt")
    |> String.split("\n")
    |> Enum.filter( &(&1 != "") )
    |> Enum.map(fn (row) ->
      row
      |> String.split(" ")
    end)
    |> Enum.map(&(
      %{
        number: &1 |> Enum.at(0) |> String.to_integer,
        solution: &1 |> Enum.at(1)
      }
    ))
    |> Enum.each(fn (problem) ->
      %Euler.Problem{}
      |> Euler.Problem.changeset(problem)
      |> Euler.Repo.insert
      |> IO.inspect
    end)
    start
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Euler.Endpoint.config_change(changed, removed)
    :ok
  end
end
