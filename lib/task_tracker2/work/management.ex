defmodule TaskTracker2.Work.Management do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker2.Work.Management

  schema "managements" do
    belongs_to(:manager, TaskTracker2.Accounts.User, foreign_key: :manager_id)
    belongs_to(:managed, TaskTracker2.Accounts.User, foreign_key: :managed_id)

    timestamps()
  end

  @doc false
  def changeset(%Management{} = management, attrs) do
    management
    |> cast(attrs, [:manager_id, :managed_id])
    |> validate_required([:manager_id, :managed_id])
    |> foreign_key_constraint(:manager_id)
    |> foreign_key_constraint(:managed_id)
  end
end
