defmodule ApiStackWeb.Router do
  use ApiStackWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :json_api do
    plug :accepts, ["json-api"]
    plug JaSerializer.Deserializer
  end

  scope "/", ApiStackWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ApiStackWeb do
    pipe_through :json_api

    resources "/managers", ManagerController, only: [:index, :show]
    resources "/operations", OperationController, only: [:index, :show]
  end
end
