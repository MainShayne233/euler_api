defmodule Euler.Problem do
  use Euler.Web, :model

  schema "problems" do
    field :description, :string
    field :solution, :string
    field :number, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :solution, :number])
  end

  def import do
    Euler.Repo.delete_all Euler.Problem
    File.read!("./data/solutions.txt")
    |> String.split("\n")
    |> Enum.filter( &(&1 != "") )
    |> Enum.map(fn (row) ->
      row
      |> String.split(" ")
    end)
    |> Enum.filter(&(Enum.count(&1) == 2))
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
  end
end
