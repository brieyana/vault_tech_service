# **Vault Tech Service**

API for the Vault Tech application.

**Note**: Before attempting to start the server, please refer to [Phoenix's installation guide](https://hexdocs.pm/phoenix/installation.html) to ensure you have correct dependencies installed. Vault Tech Service uses the default relational database server, PostgreSQL.

To start the server:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## **Endpoints**
### `/api/users/create_account`
----
* **Purpose:** Creates a user account

* **Method:** `POST`
  
*  **URL Params**

   None


* **Data Params**
 
   `email=[alphanumeric]`

   `first_name=[string]`

   `last_name=[string]`

   `username=[alphanumeric]`

   `password=[string]`

* **Success Response:**
  *  **Code:** 201 CREATED <br />
  *  **Content:** `{ id: 1, username: "janedoe", email: "jane@gmail.com", first_name: "jane", last_name: "doe"  }`
 
* **Error Response:**
  * **Code:** 400 BAD REQUEST <br />
  *  **Content:** `{ error: { status: 400, message: "cannot create account" } }`

* **Sample Call:**

  ```javascript
    axios.post('/api/users/create_account', 
    {
      email: "jane@gmail.com",
      first_name: "Jane",
      last_name: "Doe",
      username: "janedoe",
      password: "password12345"
    });
  ```
