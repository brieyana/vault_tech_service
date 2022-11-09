defmodule VaultTechServiceWeb.UserController do
  use VaultTechServiceWeb, :controller
  alias VaultTechServiceWeb.Storage.Users
  alias VaultTechServiceWeb.User

  use Params

  defparams(
    user_params(%{
      username: :string,
      email: :string,
      password: :string,
      first_name: :string,
      last_name: :string
    })
  )

  def create(conn, params) do
    changeset = User.changeset(%User{}, params)
    result = Users.create_user_account(changeset)

    case result do
      {:ok, user} ->
        render_success(conn, :created, user)

      # TO DO: render changeset errors (fallback controller)
      {:error, _result} ->
        render_error(conn, :bad_request, "cannot create account")
    end
  end

  def get_user_account(conn, %{"username" => username, "password" => password}) do
    case Users.get_user_account(username, password) do
      {:error, reason} ->
        render_error(conn, reason, "user not found")

      {:ok, user} ->
        render_success(conn, :ok, user)
    end
  end

  defp render_error(conn, status, message) do
    conn
    |> Plug.Conn.put_status(status)
    |> render("error.json", error: %{status: status, message: message})
  end

  defp render_success(conn, status, user) do
    conn
    |> Plug.Conn.put_status(status)
    |> render("user.json", user: user)
  end
end
