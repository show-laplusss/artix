Rails.application.routes.draw do
  
  namespace :public do
    resources :direct_message, only: [:new, :index, :show, :edit, :destroy]
    resources :comments, only: [:new, :index, :show, :edit, :destroy]
    resources :users, only: [:new, :show, :edit, :destroy]
    resources :illusts, only: [:new, :index, :show, :edit, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    root to: 'homes#top'
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
