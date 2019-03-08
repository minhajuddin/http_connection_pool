defmodule HTP do
  @moduledoc """
  HTP keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def chars(size) do
    :crypto.strong_rand_bytes(size)
    |> Base.encode64()
    |> :erlang.binary_to_list()
    |> Enum.chunk_every(80)
    |> Enum.intersperse(?\n)
    |> :erlang.iolist_to_binary()
    |> :binary.part(0, size)
  end
end
