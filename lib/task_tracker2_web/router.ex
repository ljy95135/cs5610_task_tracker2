defmodule TaskTracker2Web.Router do
  use TaskTracker2Web, :router

  alias TaskTracker2Web.SessionPlugs
  import TaskTracker2Web.SessionPlugs, only: [get_current_user: 2]

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:get_current_user)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", TaskTracker2Web do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/feed", PageController, :feed)
    get("/manage", PageController, :manage)

    resources("/users", UserController)
    resources("/tasks", TaskController)
    post("/create_with_login", TaskController, :create_with_login)
    resources("/managements", ManagementController)

    post("/session", SessionController, :create)
    delete("/session", SessionController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", TaskTracker2Web do
  #   pipe_through :api
  # end
end
