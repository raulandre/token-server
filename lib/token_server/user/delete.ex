defmodule TokenServer.User.Delete do
  alias TokenServer.{User, Repo}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid user id for deletion"}
      {:ok, uuid} -> delete_user(uuid)
    end
  end

  defp delete_user(uuid) do
    case fetch_user(uuid) do
      nil -> {:error, "User not found"}
      user -> Repo.delete(user)
    end
  end

  defp fetch_user(uuid), do: Repo.get(User, uuid)
end
