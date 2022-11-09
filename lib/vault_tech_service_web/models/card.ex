alias VaultTechServiceWeb, as: ServiceWeb

defmodule ServiceWeb.Card do
  use Ecto.Schema

  # TO DO: finish card schema
  schema "cards" do
    field :card_number, :string
    field :zip_code, :string
    field :bank, :string
    field :cvv, :string
  end

  # TO DO: add changeset
end
