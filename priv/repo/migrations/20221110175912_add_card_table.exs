defmodule VaultTechService.Repo.Migrations.AddCardTable do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :card_number, :string
      add :expiration_date, :string
      add :cvv, :string
    end
  end
end
