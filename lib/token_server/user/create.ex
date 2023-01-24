defmodule TokenServer.User.Create do
  alias TokenServer.{User, Repo}

  def call(params) do
    params
    |> User.build()
    |> create_user()
  end

  defp create_user({:ok, user}), do: Repo.insert(user)
  defp create_user({:err, user} = error), do: error
end
