defmodule Euler.Repo.Migrations.CreateProblem do
  use Ecto.Migration

  def change do
    create table(:problems) do
      add :description, :text
      add :solution, :integer
      add :number, :integer

      timestamps()
    end

  end
end
