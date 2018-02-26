defmodule TaskTracker2.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker2.Accounts.User

  schema "users" do
    field(:email, :string)
    field(:name, :string)

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
  end

  @doc false
  def changeset_update(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
    |> unique_constraint(:name)
  end

  @doc false
  def changeset_create(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
    |> unique_constraint(:name)
  end
end
