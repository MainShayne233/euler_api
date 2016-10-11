defmodule Euler.ProblemController do
  use Euler.Web, :controller
  alias Euler.Problem
  import Ecto.Query

  def check(conn, %{"number" => number, "solution" => solution}) do
    case Euler.Repo.get_by(Problem, number: number) do
      nil ->
        json conn, %{result: nil, status: 404, error: "Don't have a problem #{number}"}
      problem ->
        correctness = if problem.solution == solution, do: "correct", else: "incorrect"
        json conn, %{result: correctness, status: 200, error: nil}
    end
  end
end
