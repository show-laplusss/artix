Rails.application.routes.draw do

  root 'public/homes#top'
  namespace :public do
    resources :direct_message, only: [:create, :index, :show, :edit, :destroy]
    resources :illusts, only: [:new, :index, :show, :edit, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :rooms, only: [:create, :index, :show]
    resources :users, only: [:new, :show, :edit, :destroy, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'registrations#followings', as: 'followings'
      get 'followers' => 'registrations#followers', as: 'followers'
    end
    get 'relationships/followings'
    get 'relationships/followers'
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
