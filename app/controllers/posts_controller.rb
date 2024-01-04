class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:user)
  end
end
