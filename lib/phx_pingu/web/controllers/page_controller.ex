defmodule PhxPingu.Web.PageController do
  use PhxPingu.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
