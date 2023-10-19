defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  # def index(conn, _params) do
  #   render(conn, :index)
  # end

  # def index(conn, _params) do
  #   conn
  #   |> put_root_layout(html: false)
  #   |> render(:index)
  # end

  # def show(conn, %{"messenger" => messenger}) do
  #   render(conn, :show, messenger: messenger)
  #   # text(conn, "Hello from #{messenger}!")
  #   # json(conn, %{id: messenger})
  # end

  def show(conn, %{"messenger" => messenger}) do
    conn
    |> assign(:messenger, messenger)
    |> assign(:receiver, "Dweezil")
    |> render(:show)
  end

  def index(conn, _params) do
    conn
    |> put_layout(html: :admin)
    |> render(:index)
  end
end
