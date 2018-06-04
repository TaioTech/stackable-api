defmodule ApiStack.Stack.Manager do
  use Ecto.Schema
  import Ecto.Changeset
  alias ApiStack.Stack.Manager

  schema "managers" do
    field :title, :string
    field :usage, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(%Manager{} = manager, attrs) do
    manager
    |> cast(attrs, [:title, :usage, :status])
    |> validate_required([:title, :usage, :status])
  end
end

