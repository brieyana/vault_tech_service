defmodule VaultTechServiceWeb.UserControllerTest do
  use VaultTechServiceWeb.ConnCase
  alias VaultTechServiceWeb.UserController
  alias VaultTechServiceWeb.User

  test "successful changeset" do
    params = %{
      username: "jane_doe",
      password: "password12345",
      email: "jane_doe@gmail.com",
      first_name: "jane",
      last_name: "doe"
    }

    result = User.changeset(%User{}, params)

    assert length(result.errors) == 0
  end

  test "with invalid password" do
    params = %{
      username: "jane_doe",
      password: "p",
      email: "jane_doe@gmail.com",
      first_name: "jane",
      last_name: "doe"
    }

    result = User.changeset(%User{}, params)

    assert length(result.errors) > 0
  end

  test "with invalid username" do
    params = %{
      username: "%jane_doe",
      password: "password12345",
      email: "jane_doe@gmail.com",
      first_name: "jane",
      last_name: "doe"
    }

    result = User.changeset(%User{}, params)

    assert length(result.errors) > 0
  end

  test "with invalid email" do
    params = %{
      username: "jane_doe",
      password: "password12345",
      email: "email",
      first_name: "jane",
      last_name: "doe"
    }

    result = User.changeset(%User{}, params)

    assert length(result.errors) > 0
  end
end
