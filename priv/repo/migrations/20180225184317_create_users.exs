defmodule TaskTracker2.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string)
      add(:name, :string)

      timestamps()
    end

    create(unique_index(:users, [:email]))
    create(unique_index(:users, [:name]))
  end
end
