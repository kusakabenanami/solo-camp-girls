class Admin::CampCommentsController < ApplicationController

  def destroy
    @camp_comment = CampComment.find(params[:id])
    @camp_comment.destroy
    redirect_to admin_top_path
  end

end
