class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    logger.debug(params.inspect)
    if @user.update(user_params)
      flash[:notice] = "会員情報を変更しました"
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :is_withdrawal)
  end

end
