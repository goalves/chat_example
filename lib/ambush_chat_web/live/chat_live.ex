defmodule AmbushChatWeb.ChatLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias AmbushChat.{Message, Storage}
  alias Phoenix.Socket.Broadcast

  def mount(_params, _session, socket) do
    if connected?(socket), do: AmbushChat.subscribe()

    {:ok, assign(socket, :messages, Storage.get_messages())}
  end

  def handle_event("submit_message", %{"message" => %{"text" => text}}, socket) do
    :ok = text |> Message.new() |> Storage.create_message()
    {:noreply, socket}
  end

  def handle_info("new_message", %{message: message = %Message{}}, socket) do
    updated_socket = assign(socket, :messages, [message | socket.assigns.messages])

    {:noreply, updated_socket}
  end

  def handle_info(%Broadcast{event: "new_message", payload: message = %Message{}}, socket) do
    updated_socket = assign(socket, :messages, [message | socket.assigns.messages])

    {:noreply, updated_socket}
  end
end
