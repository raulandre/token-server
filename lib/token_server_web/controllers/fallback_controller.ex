defmodule TokenServerWeb.FallbackController do
  use TokenServerWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(TokenServerWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
