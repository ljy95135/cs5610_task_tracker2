defmodule TaskTracker2.Work do
  @moduledoc """
  The Work context.
  """

  import Ecto.Query, warn: false
  alias TaskTracker2.Repo

  alias TaskTracker2.Work.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
    |> Repo.preload(:user_from)
    |> Repo.preload(:user_to)
  end

  def list_tasks_by_to_id(id) do
    query = from(t in Task, where: t.to_id == ^id)

    Repo.all(query)
    |> Repo.preload(:user_from)
  end

  def list_tasks_by_from_id(id) do
    query = from(t in Task, where: t.from_id == ^id)

    Repo.all(query)
    |> Repo.preload(:user_to)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id) do
    Repo.get!(Task, id)
    |> Repo.preload(:user_from)
    |> Repo.preload(:user_to)
  end

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset_create(attrs)
    |> Repo.insert()
  end

  def create_task_login(attrs \\ %{}) do
    %Task{}
    |> Task.changeset_create(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end

  alias TaskTracker2.Work.Management

  @doc """
  Returns the list of managements.

  ## Examples

      iex> list_managements()
      [%Management{}, ...]

  """
  def list_managements do
    Repo.all(Management)
    |> Repo.preload(:manager)
    |> Repo.preload(:managed)
  end

  @doc """
  Gets a single management.

  Raises `Ecto.NoResultsError` if the Management does not exist.

  ## Examples

      iex> get_management!(123)
      %Management{}

      iex> get_management!(456)
      ** (Ecto.NoResultsError)

  """
  def get_management!(id) do
    Repo.get!(Management, id)
    |> Repo.preload(:manager)
    |> Repo.preload(:managed)
  end

  @doc """
  Creates a management.

  ## Examples

      iex> create_management(%{field: value})
      {:ok, %Management{}}

      iex> create_management(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_management(attrs \\ %{}) do
    %Management{}
    |> Management.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a management.

  ## Examples

      iex> update_management(management, %{field: new_value})
      {:ok, %Management{}}

      iex> update_management(management, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_management(%Management{} = management, attrs) do
    management
    |> Management.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Management.

  ## Examples

      iex> delete_management(management)
      {:ok, %Management{}}

      iex> delete_management(management)
      {:error, %Ecto.Changeset{}}

  """
  def delete_management(%Management{} = management) do
    Repo.delete(management)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking management changes.

  ## Examples

      iex> change_management(management)
      %Ecto.Changeset{source: %Management{}}

  """
  def change_management(%Management{} = management) do
    Management.changeset(management, %{})
  end
end
