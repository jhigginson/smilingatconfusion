class CommentsController < ApplicationController

  def create
    @tab = Tab.find_by_id params[:tab_id]
    @comment = @tab.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to @tab
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:title, :comment)
  end
end
