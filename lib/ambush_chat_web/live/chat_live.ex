defmodule AmbushChatWeb.ChatLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias AmbushChat.{Message, Storage}
  alias Phoenix.Socket.Broadcast

  def mount(_params, _session, socket) do
    if connected?(socket), do: AmbushChat.subscribe()
    socket = assign(socket, :messages, Storage.get_messages())

    {:ok, socket, temporary_assigns: [messages: []]}
  end

  def handle_event("submit_message", %{"message" => %{"text" => text}}, socket) do
    :ok = text |> Message.new() |> Storage.create_message()
    {:noreply, socket}
  end

  def handle_info(%Broadcast{event: "new_message", payload: message = %Message{}}, socket),
    do: {:noreply, assign(socket, :messages, [message])}
end
