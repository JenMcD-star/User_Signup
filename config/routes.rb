Rails.application.routes.draw do
    root to: "home#index"
  
    get "sign_up", to: "user#new"
    post "sign_up", to: "user#create"
    resources :user

  end
