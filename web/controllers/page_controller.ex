defmodule CollegeSpec.PageController do
  use CollegeSpec.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
