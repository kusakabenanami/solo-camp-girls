class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]

  def show
    @user = current_user
    #@camps = @user.camps
    @camp = Camp.new

    search_term = params[:search].to_s.strip # .to_s で nil を空文字列に変換し、.strip で前後の空白を削除

    if search_term.blank?
      # 検索条件が空の場合はすべてのコメントを表示
      @camps = @user.camps
    else
      # 検索条#件が存在する場合は部分一致で検索
      @camps = @user.camps.where("title LIKE ?", "%#{search_term}%")
    end
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