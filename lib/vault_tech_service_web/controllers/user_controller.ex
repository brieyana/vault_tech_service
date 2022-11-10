defmodule VaultTechServiceWeb.UserController do
  use VaultTechServiceWeb, :controller

  alias VaultTechServiceWeb.Storage.Users
  alias VaultTechServiceWeb.User
  import Ecto.Changeset
  import Plug.Conn

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
    changeset =
      User.changeset(%User{}, params)
      |> Users.create_user_account()

    case changeset do
      {:ok, user} ->
        render_success(conn, :created, user)

      {:error, changeset} ->
        errors =
          traverse_errors(changeset, fn {msg, opts} ->
            Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
              opts
              |> Keyword.get(String.to_existing_atom(key), key)
              |> to_string()
            end)
          end)

        render_error(conn, :bad_request, errors)
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

  defp render_error(conn, status, reason) do
    conn
    |> put_status(status)
    |> render("error.json", error: %{status: status, reason: reason})
  end

  defp render_success(conn, status, user) do
    conn
    |> put_status(status)
    |> render("user.json", user: user)
  end
end
