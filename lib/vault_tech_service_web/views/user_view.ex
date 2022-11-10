defmodule VaultTechServiceWeb.UserView do
  use VaultTechServiceWeb, :view

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    }
  end

  def render("error.json", %{error: error}) do
    %{
      error: %{
        reason: error.reason,
        status: Plug.Conn.Status.code(error.status)
      }
    }
  end
end
