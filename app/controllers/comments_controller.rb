class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def index
    @comment = Comment.all
  end

  def create
    @comment = Comment.new(commentParams)
    if @comment.save
      redirect_to comments_path(@comment)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end


end
