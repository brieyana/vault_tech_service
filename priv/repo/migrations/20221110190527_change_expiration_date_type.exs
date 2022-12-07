defmodule VaultTechService.Repo.Migrations.ChangeExpirationDateType do
  use Ecto.Migration

  def change do
    alter table(:cards) do
      remove :expiration_date
      add :expiration_date, :date
    end
  end
end
