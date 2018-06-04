defmodule ApiStack.Repo.Migrations.CreateOperations do
  use Ecto.Migration

  def change do
    create table(:operations) do
      add :manager_id, references(:managers)
      add :tasks, :integer
      add :completed, :integer, default: 0
      add :running, :boolean, default: false
      timestamps()
    end

  end
end
