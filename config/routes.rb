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
  namespace :admin do
    get "/top" => "homes#top", as: :top
    # resources :orders, only: [:show, :index, :update]
    resources :users, only: [:index, :show, :edit, :update]
    # resources :genres, only: [:index, :edit, :create, :update]
    # resources :order_details, only: [:update]
  end

  namespace :public do
    get "/about" => "homes#about"
    # get "orders/confirm" => "orders#confirm"
    # get "/orders/confirm" => "orders#confirm"
    # post "/orders/confirm" => "orders#confirm"
    get "/users/confirm" => "users#confirm"
    patch "/users/withdrawal" => "users#withdrawal"
    get "/users/mypage" => "users#show"
    patch "/users/mypage" => "users#update"
    # get "/orders/complete" => "orders#complete"
    get "/users/information/edit" => "users#edit"
    resources :users, only: [:show, :create, :edit, :update, :index]
    # resources :items, only:[:show, :index]
     resources :cart_items, only:[:index, :create, :update, :destroy] do
      # collection do
      #   delete "destroy_all" => "cart_items#destroy_all"
      # end
      end
    resources :addresses, only:[:index, :create, :destroy, :show, :update, :edit]
  end

  resources :camps, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
