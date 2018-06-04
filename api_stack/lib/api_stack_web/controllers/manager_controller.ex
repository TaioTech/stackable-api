defmodule ApiStackWeb.ManagerController do
  use ApiStackWeb, :controller

  alias ApiStack.Stack
  alias ApiStack.Stack.Manager

  action_fallback ApiStackWeb.FallbackController

  def index(conn, _params) do
    managers = Stack.list_managers()
    render(conn, "index.json", managers: managers)
  end

  def create(conn, %{"manager" => manager_params}) do
    with {:ok, %Manager{} = manager} <- Stack.create_manager(manager_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", manager_path(conn, :show, manager))
      |> render("show.json", manager: manager)
    end
  end

  def show(conn, %{"id" => id}) do
    manager = Stack.get_manager!(id)
    render(conn, "show.json", manager: manager)
  end

  def update(conn, %{"id" => id, "manager" => manager_params}) do
    manager = Stack.get_manager!(id)

    with {:ok, %Manager{} = manager} <- Stack.update_manager(manager, manager_params) do
      render(conn, "show.json", manager: manager)
    end
  end

  def delete(conn, %{"id" => id}) do
    manager = Stack.get_manager!(id)
    with {:ok, %Manager{}} <- Stack.delete_manager(manager) do
      send_resp(conn, :no_content, "")
    end
  end
end
