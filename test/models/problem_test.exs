defmodule Euler.ProblemTest do
  use Euler.ModelCase

  alias Euler.Problem

  @valid_attrs %{description: "some content", number: 42, solution: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Problem.changeset(%Problem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Problem.changeset(%Problem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
