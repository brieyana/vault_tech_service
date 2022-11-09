defmodule VaultTechServiceWeb.Storage.Users do
  alias VaultTechService.Repo
  alias VaultTechServiceWeb.User
  import Ecto.Query, only: [from: 2]

  def get_user_account(username, password) do
    case Repo.one(
           from u in User,
             where: u.username == ^username,
             where: u.password == ^password,
             select: u
         ) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def get_user_by_username(username) do
    case Repo.one(
           from u in User,
             where: u.username == ^username,
             select: u
         ) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def create_user_account(changeset) do
    Repo.insert(changeset)
  end
end
