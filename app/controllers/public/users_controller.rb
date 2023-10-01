class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]

  def show
    @user = User.find(params[:id])
    @camps = @user.camps
    @camp = Camp.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @camp = Camp.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "正常に作成されました"
      redirect_to user_path(@user.id)
    else
      @users = User.all
      render :edit
    end
  end

  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end