class PostsController < ApplicationController

  def new
    @post = Post.new(user_id: params[:user_id])
  end

  def create

    @post = Post.create(post_params)
    p @post, params[:user_id]
      if @post.save
          redirect_to posts_url
      else
        p "Post not saved!"
      end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end
end
