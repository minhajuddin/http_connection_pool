defmodule HTPWeb.PageController do
  use HTPWeb, :controller

  # /?size=10kb
  # /?size=100kb
  # /?size=1000kb
  def index(conn, params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, body_for(params["size"]))
  end

  @onekb HTP.chars(1 * 1024)
  @tenkb HTP.chars(10 * 1024)
  @hundredkb HTP.chars(100 * 1024)
  @thousandkb HTP.chars(1000 * 1024)
  # returns a body of size KB
  defp body_for(size)
  defp body_for("1kb"), do: @onekb
  defp body_for("10kb"), do: @tenkb
  defp body_for("100kb"), do: @hundredkb
  defp body_for("1000kb"), do: @thousandkb
  defp body_for(_), do: body_for("10kb")
end
