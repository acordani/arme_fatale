class CommentsController < ApplicationController

  before_action :set_land

  def create
    @comment = Comment.new(comment_params)
    @comment.land = @land
    @comment.user = current_user
      if @comment.save
        redirect_to land_path(@land)
      else
        render :show
      end
  end

  private

  def set_land
    @land = Land.find(params[:land_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
