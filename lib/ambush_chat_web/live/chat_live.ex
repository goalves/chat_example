defmodule AmbushChatWeb.ChatLive do
  use Phoenix.LiveView

  alias AmbushChat.Message

  def mount(_params, _session, socket) do
    messages = [Message.new("oi"), Message.new("tudo bem?")]

    {:ok, assign(socket, :messages, messages)}
  end
end
