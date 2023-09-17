class Admin::HomesController < ApplicationController

  def top
    @users = User.all
    @camp_comments = @users.map do |user|
      user.camp_comments
    end.flatten
  end

end
