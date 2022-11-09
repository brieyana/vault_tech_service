defmodule VaultTechServiceWeb.WebView do
  use VaultTechServiceWeb, :view

  def render("show.json", %{message: message}) do
    %{data: message}
  end
end
