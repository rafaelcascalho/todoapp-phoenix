defmodule TodoappWeb.Router do
  use TodoappWeb, :router

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

  scope "/", TodoappWeb do
    pipe_through :browser

    get "/", TaskController, :index
    resources "/tasks", TaskController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoappWeb do
  #   pipe_through :api
  # end
end
