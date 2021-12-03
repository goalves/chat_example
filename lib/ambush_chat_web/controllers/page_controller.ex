defmodule AmbushChatWeb.PageController do
  use AmbushChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
