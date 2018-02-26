defmodule TaskTracker2.Work.Task do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias TaskTracker2.Work.Task
  alias TaskTracker2.Work.Management
  alias TaskTracker2.Work.TimeBlock

  schema "tasks" do
    field(:body, :string)
    field(:finished, :boolean, default: false)
    field(:title, :string)

    belongs_to(:user_from, TaskTracker2.Accounts.User, foreign_key: :from_id)
    belongs_to(:user_to, TaskTracker2.Accounts.User, foreign_key: :to_id)

    has_many(:time_block, TimeBlock)

    timestamps()
  end

  @doc false
  def changeset_create(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :finished, :from_id, :to_id])
    |> validate_required([:title, :body, :finished, :from_id, :to_id])
    |> foreign_key_constraint(:from_id)
    |> foreign_key_constraint(:to_id)
    |> validate_in_management()
  end

  def validate_in_management(changeset, _opts \\ []) do
    from = get_change(changeset, :from_id)
    to = get_change(changeset, :to_id)

    q =
      from(
        p in TaskTracker2.Work.Management,
        where: p.manager_id == ^from and p.managed_id == ^to
      )

    m = TaskTracker2.Repo.one(q)

    if m do
      changeset
    else
      changeset
      |> add_error(:from_id, "not find from and to in management table.")
    end
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :body, :finished, :from_id, :to_id])
    |> validate_required([:title, :body, :finished, :from_id, :to_id])
  end
end
