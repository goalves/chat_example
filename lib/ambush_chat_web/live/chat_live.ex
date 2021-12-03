defmodule AmbushChatWeb.ChatLive do
  use Phoenix.LiveView

  def render(_assigns) do
    messages = ["oi", "tudo bem?"]
    AmbushChatWeb.PageView.render("chat.html", messages: messages)
  end
end
