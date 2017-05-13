defmodule Agenda.Router do
  use Agenda.Web, :router

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

  scope "/", Agenda do
    pipe_through :browser # Use the default browser stack

    get "/", ContactController, :index
    resources "/contacts", ContactController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Agenda do
  #   pipe_through :api
  # end
end
