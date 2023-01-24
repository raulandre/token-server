defmodule TokenServer do
  alias TokenServer.User

  @moduledoc """
  TokenServer keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_user(params), to: User.Create, as: :call
end
