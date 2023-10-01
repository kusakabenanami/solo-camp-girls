class Public::CampsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:update]

  def new
    @camp = Camp.new
  end

  def create
      @camp = Camp.new(camp_params)
      @camp.user_id = current_user.id
    if @camp.save
      redirect_to camp_path(@camp.id), notice: "正常に作成されました"
    else
      @camps = Camp.all
      render :index
    end
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def index
    @camps = Camp.all
    @camp = Camp.new
  end

  def show
    @camp = Camp.find(params[:id])
    @camp_new = Camp.new
    @user = @camp.user
  end

  def update
    @camp = Camp.find(params[:id])
    if @camp.update(camp_params)
      flash[:notice] = "正常に変更されました"
      redirect_to camp_path(@camp.id)
    else
      @@camps = Camp.all
      render :edit
    end
  end

  def destroy
    camp = Camp.find(params[:id])
    camp.destroy
    redirect_to camps_path
  end

  # 投稿データのストロングパラメータ
  private

  def is_matching_login_user
    camp = Camp.find(params[:id])
    unless camp.user.id == current_user.id
      redirect_to camps_path
    end
  end

  def camp_params
    params.require(:camp).permit(:title, :body, :star)
  end

end

