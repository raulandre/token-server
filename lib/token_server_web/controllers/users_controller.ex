defmodule TokenServerWeb.UsersController do
  use TokenServerWeb, :controller

  action_fallback TokenServerWeb.FallbackController

  def create(conn, params) do
    params
    |> TokenServer.create_user()
    |> handle_create(conn)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> TokenServer.delete_user()
    |> handle_delete(conn)
  end

  defp handle_create({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_create({:error, _user} = error, _conn), do: error

  defp handle_delete({:ok, _user}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _user} = error, _conn), do: error
end
