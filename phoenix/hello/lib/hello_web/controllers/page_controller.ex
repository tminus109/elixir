defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  # def index(conn, _params) do
  #   send_resp(conn, 201, "")
  # end

  # def index(conn, _params) do
  #   conn
  #   |> put_resp_content_type("text/plain")
  #   |> send_resp(201, "")
  # end

  # def index(conn, _params) do
  #   conn
  #   |> put_status(202)
  #   |> render(:home, layout: false)
  # end

  # def index(conn, _params) do
  #   redirect(conn, to: ~p"/redirect_test")
  # end

  # def redirect_test(conn, _params) do
  #   render(conn, :home, layout: false)
  # end

  # def index(conn, _params) do
  #   conn
  #   |> put_flash(:error, "Let's pretend we have an error.")
  #   |> render(:home, layout: false)
  # end

  # def index(conn, _params) do
  #   conn
  #   |> put_flash(:error, "Let's pretend we have an error.")
  #   |> redirect(to: ~p"/redirect_test")
  # end
end
