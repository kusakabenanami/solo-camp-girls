Rails.application.routes.draw do
  get 'camp_comments/create'
  get 'camp_comments/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
  root "public/homes#top"

  post '/homes/guest_sign_in', to: 'public/homes#guest_sign_in'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

   # 検索機能のルーティング
  get "/search" => "searches#search"

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
  namespace :admin do
    get "/top" => "homes#top", as: :top
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    get "/about" => "homes#about"
    get "/users/confirm" => "users#confirm"
    patch "/users/withdrawal" => "users#withdrawal"
    get "/users/mypage" => "users#show"
    patch "/users/mypage" => "users#update"
    get "/users/information/edit" => "users#edit"
    resources :users, only: [:show, :create, :edit, :update, :index]
    resources :addresses, only:[:index, :create, :destroy, :show, :update, :edit]
  end

  scope module: :public do
    resources :camps, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :camp_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
end
