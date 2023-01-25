defmodule TokenServerWeb.UsersController do
  use TokenServerWeb, :controller

  action_fallback TokenServerWeb.FallbackController

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

  defp handle_response({:error, _user} = error, _conn), do: error
end
