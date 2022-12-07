alias VaultTechServiceWeb, as: ServiceWeb

defmodule ServiceWeb.Card do
  use Ecto.Schema
  import Ecto.Changeset

  # TO DO: finish card schema
  schema "cards" do
    field :card_number, :string
    field :cvv, :string
    field :expiration_date, :date
    belongs_to :user, VaultTechServiceWeb.User
  end

  def changeset(card, params \\ %{}) do
    keys = [:card_number, :cvv, :expiration_date, :user_id]

    card
    |> cast(params, keys)
    |> validate_required(keys)
    |> validate_format(:card_number, ~r/^[0-9]/)
    |> validate_format(:cvv, ~r/^[0-9]/)
    |> validate_length(:card_number, is: 16)
    |> validate_length(:cvv, min: 3, max: 4)
  end

  # TO DO: add changeset
end
