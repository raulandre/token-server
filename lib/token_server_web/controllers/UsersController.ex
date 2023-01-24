defmodule TokenServerWeb.UsersController do
  use TokenServerWeb, :controller

  def create(conn, params) do
    params
    |> TokenServer.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end
end
