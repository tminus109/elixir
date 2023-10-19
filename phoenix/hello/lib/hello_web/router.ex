defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug(:accepts, ["html", "json"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {HelloWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(HelloWeb.Plugs.Locale, "en")
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # pipeline :auth do
  #   plug(:browser)
  #   plug(:ensure_authenticated_user)
  #   plug(:ensure_user_owns_review)
  # end

  scope "/", HelloWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    # get("/redirect_test", PageController, :redirect_test)
    # resources("/posts", PostController, only: [:index, :show])
    # resources("/comments", CommentController, except: [:delete])
    get("/hello", HelloController, :index)
    get("/hello/:messenger", HelloController, :show)
  end

  # resources "/users", UserController do
  #   resources("/posts", PostController)
  # end

  # scope "/reviews", HelloWeb do
  #   pipe_through(:auth)

  #   resources("/", ReviewController)
  # end

  # scope "/admin", HelloWeb.Admin do
  #   pipe_through(:browser)

  #   resources("/images", ImageController)
  #   resources("/reviews", ReviewController)
  #   resources("/users", UserController)
  # end

  # scope "/api", HelloWeb.Api, as: :api do
  #   pipe_through(:api)

  #   scope "/v1", V1, as: :v1 do
  #     resources("/images", ImageController)
  #     resources("/reviews", ReviewController)
  #     resources("/users", UserController)
  #   end
  # end

  # Other scopes may use custom stacks.
  scope "/api", HelloWeb do
    pipe_through(:api)
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:hello, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: HelloWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
