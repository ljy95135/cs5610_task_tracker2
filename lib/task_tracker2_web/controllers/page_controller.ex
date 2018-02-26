defmodule TaskTracker2Web.PageController do
  use TaskTracker2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def feed(conn, _params) do
    id = get_session(conn, :user_id)

    tasks = TaskTracker2.Work.list_tasks_by_to_id(id)
    tasks_give = TaskTracker2.Work.list_tasks_by_from_id(id)

    managers = TaskTracker2.Work.list_managers_by_id(id)
    manageds = TaskTracker2.Work.list_manageds_by_id(id)

    changeset = TaskTracker2.Work.change_task(%TaskTracker2.Work.Task{})

    render(
      conn,
      "task.html",
      tasks_your: tasks,
      task_give: tasks_give,
      managers: managers,
      manageds: manageds,
      changeset: changeset
    )
  end

  def manage(conn, _params) do
    render(conn, "manage.html")
  end
end
