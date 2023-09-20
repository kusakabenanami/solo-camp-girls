class Public::FavoritesController < ApplicationController
  def create
    @camp = Camp.find(params[:camp_id])
    favorite = current_user.favorites.new(camp_id: @camp.id)
    favorite.save
    render 'replace.js.erb'
  end

  def destroy
    @camp = Camp.find(params[:camp_id])
    favorite = current_user.favorites.find_by(camp_id: @camp.id)
    favorite.destroy
    render 'replace.js.erb'
  end
end
