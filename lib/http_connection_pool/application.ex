defmodule HTP.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      HTPWeb.Endpoint
      # Starts a worker by calling: HTP.Worker.start_link(arg)
      # {HTP.Worker, arg},
    ]

    spawn fn ->
      :pids = :ets.new :pids, [:named_table, :public]
      :timer.sleep :infinity
    end

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HTP.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HTPWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
