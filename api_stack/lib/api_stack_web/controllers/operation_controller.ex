defmodule ApiStackWeb.OperationController do
  use ApiStackWeb, :controller

  alias ApiStack.Stack
  alias ApiStack.Stack.Operation

  action_fallback ApiStackWeb.FallbackController

  def index(conn, _params) do
    operations = Stack.list_operations()
    render(conn, "index.json-api", data: operations)
  end

  def create(conn, %{"operation" => operation_params}) do
    with {:ok, %Operation{} = operation} <- Stack.create_operation(operation_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", operation_path(conn, :show, operation))
      |> render("show.json", data: operation)
    end
  end

  def show(conn, %{"id" => id}) do
    operation = Stack.get_operation!(id)
    render(conn, "show.json", data: operation)
  end

  def update(conn, %{"id" => id, "operation" => operation_params}) do
    operation = Stack.get_operation!(id)

    with {:ok, %Operation{} = operation} <- Stack.update_operation(operation, operation_params) do
      render(conn, "show.json", operation: operation)
    end
  end

  def delete(conn, %{"id" => id}) do
    operation = Stack.get_operation!(id)
    with {:ok, %Operation{}} <- Stack.delete_operation(operation) do
      send_resp(conn, :no_content, "")
    end
  end
end
