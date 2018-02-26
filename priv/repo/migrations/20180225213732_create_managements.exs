defmodule TaskTracker2.Repo.Migrations.CreateManagements do
  use Ecto.Migration

  def change do
    create table(:managements) do
      add :manager_id, references(:users, on_delete: :nothing)
      add :managed_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:managements, [:manager_id])
    create index(:managements, [:managed_id])
  end
end
