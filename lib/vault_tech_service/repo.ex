defmodule VaultTechService.Repo do
  use Ecto.Repo,
    otp_app: :vault_tech_service,
    adapter: Ecto.Adapters.Postgres
end
