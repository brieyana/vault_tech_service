defmodule VaultTechServiceWeb.WebController do
  use VaultTechServiceWeb, :controller

  def show(conn, _params) do
    message = %{message: "Up and running!"}

    render(conn, "show.json", message: message)
  end
end
