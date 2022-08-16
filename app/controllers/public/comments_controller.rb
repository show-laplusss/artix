class Public::CommentsController < ApplicationController
  def new
  end
  
  def create
    illust = Illust.find(params[:illust_id])
    comment = current_user.comments.new(comment_params)
    comment.illust_id = illust.id
    comment.save
    redirect_to illust_path(illust)
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to illust_path(params[:illust_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  
end
