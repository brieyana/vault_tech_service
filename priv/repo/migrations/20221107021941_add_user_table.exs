defmodule VaultTechService.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :password, :string
      add :email, :string
      add :first_name, :string
      add :last_name, :string
    end
  end
end
