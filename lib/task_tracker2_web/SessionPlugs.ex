defmodule TaskTracker2Web.SessionPlugs do
  alias Plug.Conn

  def get_current_user(conn, _params) do
    user_id = Conn.get_session(conn, :user_id)
    user = TaskTracker2.Accounts.get_user(user_id || -1)
    Conn.assign(conn, :current_user, user)
  end
end
