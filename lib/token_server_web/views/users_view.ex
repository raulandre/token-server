defmodule TokenServerWeb.UsersView do
  use TokenServerWeb, :view
  alias TokenServer.User

  def render("create.json", %{user: %User{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "User created!",
      user: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end
end
