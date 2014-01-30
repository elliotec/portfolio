Portfolio2::Application.routes.draw do
  resources :comments

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :posts
  resources :projects
  
  root 'welcome#index'
end
