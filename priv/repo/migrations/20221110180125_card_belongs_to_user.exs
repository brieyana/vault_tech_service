defmodule VaultTechService.Repo.Migrations.CardBelongsToUser do
  use Ecto.Migration

  def change do
    alter table(:cards) do
      add :user_id, references(:users)
    end
  end
end
