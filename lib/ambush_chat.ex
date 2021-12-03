defmodule AmbushChat do
  @moduledoc """
  AmbushChat keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias AmbushChatWeb.Endpoint

  @chat_topic "chat"

  def subscribe,
    do: Endpoint.subscribe(@chat_topic)

  def publish(message),
    do: Endpoint.broadcast(@chat_topic, "new_message", message)
end
