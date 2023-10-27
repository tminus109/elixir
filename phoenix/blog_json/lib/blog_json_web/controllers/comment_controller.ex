defmodule BlogJsonWeb.CommentController do
  use BlogJsonWeb, :controller

  alias BlogJson.Blog
  alias BlogJson.Blog.Comment

  action_fallback(BlogJsonWeb.FallbackController)

  def index(conn, _params) do
    comments = Blog.list_comments()
    render(conn, :index, comments: comments)
  end

  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    with {:ok, %Comment{} = comment} <- Blog.create_comment(comment_params, post_id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/posts/#{post_id}/comments/#{comment}")
      |> render(:show, comment: comment)
    end
  end

  def show(conn, %{"id" => id}) do
    comment = Blog.get_comment!(id)
    render(conn, :show, comment: comment)
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Blog.get_comment!(id)

    with {:ok, %Comment{} = comment} <- Blog.update_comment(comment, comment_params) do
      render(conn, :show, comment: comment)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Blog.get_comment!(id)

    with {:ok, %Comment{}} <- Blog.delete_comment(comment) do
      send_resp(conn, :no_content, "")
    end
  end
end
