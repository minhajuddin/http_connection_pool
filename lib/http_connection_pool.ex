defmodule HTP do
  @moduledoc """
  HTP keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @chars 0..255
         |> Enum.filter(fn x -> String.printable?(<<x>>) end)
         |> Enum.with_index()
         |> Enum.map(fn {x, idx} -> {idx, x} end)
         |> Enum.into(%{})
  @chars_length Enum.count(@chars)
  def chars(size) do
    :crypto.strong_rand_bytes(size)
    |> :erlang.binary_to_list()
    |> Enum.map(fn x -> @chars[rem(x, @chars_length)] end)
    |> :erlang.iolist_to_binary()
  end
end
