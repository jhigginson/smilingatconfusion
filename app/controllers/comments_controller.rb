class CommentsController < ApplicationController
  before_action :login_required
  before_action :role_required
  before_action :set_tab
  before_action :set_comment, only: [:destroy]
  before_action :owner_required, only: [:destroy]

  def create
    @comment = @tab.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to @tab
    end
  end

  def destroy
    @comment.destroy

    flash[:notice] = "Comment has been deleted."

    redirect_to @tab
  end

  private

  def set_tab
    @tab = Tab.find_by_id params[:tab_id]
  end

  def set_comment
    @comment = @tab.comments.find params[:id]
    @owner_check_object = @tab
  end

  def comment_params
      params.require(:comment).permit(:title, :comment)
  end
end
