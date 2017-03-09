defmodule PhxPingu.Web.Router do
  use PhxPingu.Web, :router

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

  scope "/", PhxPingu.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/penguins", PenguinController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxPingu.Web do
  #   pipe_through :api
  # end
end
