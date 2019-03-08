defmodule HTPWeb.Router do
  use HTPWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HTPWeb do
    pipe_through :api
  end
end
