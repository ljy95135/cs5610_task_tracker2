defmodule TaskTracker2.Work.TimeBlock do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker2.Work.TimeBlock
  alias TaskTracker2.Work.Task

  schema "time_blocks" do
    field(:end, :naive_datetime)
    field(:start, :naive_datetime)
    belongs_to(:task, Task)

    timestamps()
  end

  @doc false
  def changeset(%TimeBlock{} = time_block, attrs) do
    time_block
    |> cast(attrs, [:task_id, :start, :end])
    |> validate_required([:task_id, :start, :end])
  end
end
