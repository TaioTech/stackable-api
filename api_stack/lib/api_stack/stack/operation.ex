defmodule ApiStack.Stack.Operation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "operations" do
    field :tasks, :integer
    field :completed, :integer
    field :running, :boolean

    belongs_to :manager, ApiStack.Stack.Manager

    timestamps()
  end

  @doc false
  def changeset(operation, attrs) do
    operation
    |> cast(attrs, [:tasks, :completed, :running, :manager_id])
    |> validate_required([:tasks, :completed, :running, :manager_id])
  end
end
