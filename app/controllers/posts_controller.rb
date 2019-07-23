class PostsController < ApplicationController
  before_action :logged_in?, only: %i[new create]
  # before_action :current_user, only: %i[new create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
