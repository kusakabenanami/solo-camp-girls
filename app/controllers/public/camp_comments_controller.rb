class Public::CampCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @camp = Camp.find(params[:camp_id])
    @camp_comment = current_user.camp_comments.new(camp_comment_params)
    @camp_comment.camp_id = @camp.id
    @camp_comment.save
    redirect_to camp_path(@camp)
  end

  def destroy
    @camp = Camp.find(params[:camp_id])
    @camp_comment = @camp.camp_comments.find(params[:id])
    @camp_comment.destroy
    render 'destroy.js.erb'
  end

  private
  def camp_comment_params
    params.require(:camp_comment).permit(:comment)
  end
end
