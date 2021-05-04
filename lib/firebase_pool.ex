defmodule FirebasePool do
  @moduledoc """
  FirebasePool keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def send_message(message) do
    :poolboy.transaction(
        :worker,
        fn pid -> GenServer.call(pid, {:send_message, message}) end,
        5000
      )
  end
end
