# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
      # ログイン処理を行うアクション
      email = params[:admin][:email]
      password = params[:admin][:password]

      # 特定のメールアドレスとパスワードをチェックする条件を設定
    if email == 'admin@gmail.com' && password == 'admin123'
      # ログイン成功時の処理
      session[:admin_id] = 1 # ここでセッションに管理者のIDを格納するなど、ログイン状態を管理
      redirect_to admin_top_path, notice: 'ログインに成功しました。'
    else
      # ログイン失敗時の処理
      flash.now[:alert] = 'メールアドレスまたはパスワードが正しくありません。'
      render :new
    end
  end

  def destroy
    # ログアウト処理を行うアクション
    session[:admin_id] = nil
    redirect_to root_path, notice: 'ログアウトしました。'
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def after_sign_in_path_for(resource)
    admin_top_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

end
