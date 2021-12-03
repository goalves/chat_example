defmodule AmbushChatWeb.ChatLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias AmbushChat.{Message, Storage}

  def mount(_params, _session, socket) do
    messages = Storage.get_messages()

    {:ok, assign(socket, :messages, messages)}
  end

  def handle_event("submit_message", %{"message" => %{"text" => text}}, socket) do
    message = Message.new(text)
    :ok = Storage.create_message(message)

    updated_socket = assign(socket, :messages, [message | socket.assigns.messages])
    {:noreply, updated_socket}
  end
end
