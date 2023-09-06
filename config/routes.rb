Rails.application.routes.draw do
  root "public/homes#top"

  post '/homes/guest_sign_in', to: 'public/homes#guest_sign_in'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # ユーザー側
  devise_for :users, :controllers => {
  :sessions => 'public/sessions',
  :passwords => 'public/passwords',
  :registrations => 'public/registrations',
  }
  # 管理者側
  devise_for :admin, :controllers => {
  :sessions => 'admin/sessions',
  :passwords => 'admin/passwords',
  :registrations => 'admin/registrations',
  }

  resources :camps, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :create, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
