defmodule FirebasePoolWeb.PageController do
  use FirebasePoolWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end


  def send(conn, _params) do
    conn
    |> text("Enviado")
  end
end
