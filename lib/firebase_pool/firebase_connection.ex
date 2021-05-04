defmodule FirebasePool.FirebaseConnection do

  use GenServer
  require Logger
  @impl true
  def init(_stack) do
    {:ok, ""}
  end

  @spec start_link(any()) :: any()
  def start_link(_args) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl true
  def handle_call({:send_message, message}, _from, state) do
    {:ok, body} = Fcmex.push("user_token",
      notification: %{
      title: "foo",
      body: "bar",
      click_action: "open_foo",
      icon: "new",
      }
    )
    {:reply, :ok, state}
  end


end
