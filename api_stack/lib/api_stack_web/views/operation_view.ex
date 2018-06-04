defmodule ApiStackWeb.OperationView do
  use ApiStackWeb, :view
  alias ApiStackWeb.OperationView

  def render("index.json", %{operations: operations}) do
    %{data: render_many(operations, OperationView, "operation.json")}
  end

  def render("show.json", %{operation: operation}) do
    %{data: render_one(operation, OperationView, "operation.json")}
  end

  def render("operation.json", %{operation: operation}) do
    %{id: operation.id,
      tasks: operation.tasks,
      completed: operation.completed,
      running: operation.running,
      manager_id: operation.manager_id}
  end
end
