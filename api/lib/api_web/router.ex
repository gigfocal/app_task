defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiWeb do
    pipe_through :api
    scope "/todos", Todo do
      resources "/tasks", TaskController, only: [:index, :show, :create, :update, :delete]
    end
  end
end
