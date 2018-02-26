defmodule TaskTracker2Web.ManagementController do
  use TaskTracker2Web, :controller

  alias TaskTracker2.Work
  alias TaskTracker2.Work.Management

  def index(conn, _params) do
    managements = Work.list_managements()
    render(conn, "index.html", managements: managements)
  end

  def new(conn, _params) do
    changeset = Work.change_management(%Management{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"management" => management_params}) do
    case Work.create_management(management_params) do
      {:ok, management} ->
        conn
        |> put_flash(:info, "Management created successfully.")
        |> redirect(to: management_path(conn, :show, management))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    management = Work.get_management!(id)
    render(conn, "show.html", management: management)
  end

  def edit(conn, %{"id" => id}) do
    management = Work.get_management!(id)
    changeset = Work.change_management(management)
    render(conn, "edit.html", management: management, changeset: changeset)
  end

  def update(conn, %{"id" => id, "management" => management_params}) do
    management = Work.get_management!(id)

    case Work.update_management(management, management_params) do
      {:ok, management} ->
        conn
        |> put_flash(:info, "Management updated successfully.")
        |> redirect(to: management_path(conn, :show, management))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", management: management, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    management = Work.get_management!(id)
    {:ok, _management} = Work.delete_management(management)

    conn
    |> put_flash(:info, "Management deleted successfully.")
    |> redirect(to: management_path(conn, :index))
  end
end
