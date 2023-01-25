defmodule TokenServerWeb.ErrorViewTest do
  use TokenServerWeb.ConnCase, async: true
  alias TokenServer.User

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 500.json" do
    assert render(TokenServerWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
