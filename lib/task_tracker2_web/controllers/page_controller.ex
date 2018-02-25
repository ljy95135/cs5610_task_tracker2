defmodule TaskTracker2Web.PageController do
  use TaskTracker2Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
