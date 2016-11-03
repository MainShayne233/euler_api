defmodule Euler.Router do
  use Euler.Web, :router

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

  scope "/", Euler do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Euler do
    pipe_through :api

    get "/problem/:number/check/:solution", ProblemController, :check

    get "/problem/", ProblemController, :check

  end
end
