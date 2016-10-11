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
end
