# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :not_logged_in?, only: [:index]

  def index
    @posts = Post.all
  end

  def new
    if logged_in?
      @post = Post.new
    else
      redirect_to signin_path
    end
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
