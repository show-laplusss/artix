Rails.application.routes.draw do
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  root to: 'homes#top'
  
  namespace :public do
    resources :direct_message, only: [:new, :index, :show, :edit, :destroy]
    resources :comments, only: [:new, :index, :show, :edit, :destroy]
    resources :illusts, only: [:new, :index, :show, :edit, :destroy]
    resources :direct_messages, only: [:create]
    resources :rooms, only : [:create, :index, :show]
    resources :users, only: [:new, :show, :edit, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'registrations#followings', as: 'followings'
      get 'followers' => 'registrations#followers', as: 'followers'
    end
    get 'homes/top'
  end
  
  #管理者
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  #利用者
  devise_for :users, skip:[:passwords] ,controllers: {
    registrations:"public/registrations",
    sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
