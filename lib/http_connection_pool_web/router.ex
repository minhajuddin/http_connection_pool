defmodule HTPWeb.Router do
  use HTPWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/", HTPWeb do
    pipe_through :browser

    get "/", PageController, :index
  end
end
