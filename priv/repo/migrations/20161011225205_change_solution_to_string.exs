defmodule Euler.Repo.Migrations.ChangeSolutionToString do
  use Ecto.Migration

  def change do
    alter table(:problems) do
      modify :solution, :string
    end
  end
end
