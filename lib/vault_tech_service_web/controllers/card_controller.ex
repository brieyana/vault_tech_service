defmodule VaultTechServiceWeb.CardController do
  use VaultTechServiceWeb, :controller
  alias VaultTechServiceWeb.Storage.Cards
  alias VaultTechServiceWeb.Card

  use Params

  defparams(card_params(%{}))
end
