Portfolio2::Application.routes.draw do

  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end
    
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root 'welcome#index'
end
