defmodule AmbushChat.Message do
  @enforce_keys [:id, :text, :created_at]
  defstruct [:id, :text, :created_at]

  def new(text),
    do: %__MODULE__{id: UUID.uuid4(), text: text, created_at: DateTime.utc_now()}
end
