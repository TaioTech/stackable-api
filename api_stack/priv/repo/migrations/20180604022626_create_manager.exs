defmodule ApiStack.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :title, :string
      add :usage, :text
      add :status, :string

      timestamps()
    end

  end
end
