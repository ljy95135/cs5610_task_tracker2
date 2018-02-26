defmodule TaskTracker2.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add(:title, :string, null: false)
      add(:body, :text, null: false)
      add(:finished, :boolean, default: false, null: false)
      add(:from_id, references(:users, on_delete: :nothing))
      add(:to_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(index(:tasks, [:from_id]))
    create(index(:tasks, [:to_id]))
  end
end
