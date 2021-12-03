defmodule AmbushChat.Storage do
  use GenServer

  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  def init(opts) do
    state = %{messages: []}
    {:ok, state}
  end

  def get_messages(),
    do: GenServer.call(__MODULE__, :get_messages)

  def create_message(message) when is_binary(message),
    do: GenServer.cast(__MODULE__, {:create_message, message})

  def handle_call(:get_messages, _from, state),
    do: {:reply, state.messages, state}

  def handle_cast({:create_message, message}, state) do
    messages_updated_list = [message | state.messages]
    state = %{state | messages: messages_updated_list}

    {:noreply, state}
  end
end
