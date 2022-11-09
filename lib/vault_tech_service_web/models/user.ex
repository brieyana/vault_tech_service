alias VaultTechServiceWeb, as: ServiceWeb

defmodule ServiceWeb.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias VaultTechServiceWeb.Storage.Users

  schema "users" do
    field :email, :string
    field :username, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
  end

  # validation to insert user into database
  # CHANGESET: validates whether or not to CHANGE the
  # empty USER OBJECT!
  def changeset(user, params \\ %{}) do
    keys = [:username, :password, :email, :first_name, :last_name]

    user
    |> cast(params, keys)
    |> validate_required(keys)
    |> validate_format(:username, ~r/^[A-Za-z0-9_-]/, min: 1, max: 30)
    |> validate_username(:username)
    |> validate_format(:email, ~r/^[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> validate_length(:password, min: 12, max: 18)
    |> validate_length(:first_name, min: 1)
    |> validate_length(:last_name, min: 1)
  end

  defp validate_username(changeset, :username) do
    validate_change(changeset, :username, fn :username, username ->
      case Users.get_user_by_username(username) do
        {:error, _} -> []
        {:ok, _} -> [username: "username is taken"]
      end
    end)
  end
end