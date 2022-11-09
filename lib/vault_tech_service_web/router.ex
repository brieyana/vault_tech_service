defmodule VaultTechServiceWeb.Router do
  use VaultTechServiceWeb, :router

  pipeline :browser do
    plug :accepts, ["json"]
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {VaultTechServiceWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug CORSPlug
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug
  end

  # API endpoints
  scope "/api", VaultTechServiceWeb do
    pipe_through :api

    # get user account
    # TO DO: change to post request
    get "/users/get_user_account", UserController, :get_user_account

    # create user account
    post "/users/create_account", UserController, :create
  end

  scope "/", VaultTechServiceWeb do
    # pipe_through :browser

    get "/", WebController, :show
  end

  # live dashboard
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: VaultTechServiceWeb.Telemetry
    end
  end
end
