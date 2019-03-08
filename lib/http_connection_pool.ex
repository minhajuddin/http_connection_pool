defmodule HTP do
  @moduledoc """
  HTP keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @barts_line "I will not throw away my HTTP connections today!\n"
  @barts_line_length String.length(@barts_line)
  def chars(size) do
    line_count = div(size, @barts_line_length) + 1
    1..line_count
    |> Enum.map(fn _ -> @barts_line end)
  end
end

