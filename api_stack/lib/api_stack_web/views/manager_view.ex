defmodule ApiStackWeb.ManagerView do
  use ApiStackWeb, :view
  use JaSerializer.PhoenixView

  attributes [:id, :title, :usage, :status]
  # alias ApiStackWeb.ManagerView

  # def render("index.json", %{managers: managers}) do
  #   %{data: render_many(managers, ManagerView, "manager.json")}
  # end

  # def render("show.json", %{manager: manager}) do
  #   %{data: render_one(manager, ManagerView, "manager.json")}
  # end

  # def render("manager.json", %{manager: manager}) do
  #   %{id: manager.id,
  #     title: manager.title,
  #     usage: manager.usage,
  #     status: manager.status}
  # end
end
