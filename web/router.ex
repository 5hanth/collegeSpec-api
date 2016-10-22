defmodule CollegeSpec.Router do
  use CollegeSpec.Web, :router
  use ExAdmin.Router

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

  pipeline :auth do
    plug BasicAuth, realm: "Admin Area", username: System.get_env("CHAMBER_USER"), password: System.get_env("CHAMBER_PWD")
  end

  scope "/", CollegeSpec do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/chamber-of-secrets", ExAdmin do
    pipe_through :browser
    pipe_through :auth

    admin_routes
  end

  # Other scopes may use custom stacks.
  scope "/api", CollegeSpec do
    pipe_through :api

    resources "/colleges", CollegeController, except: [:new, :edit]
  end
end
