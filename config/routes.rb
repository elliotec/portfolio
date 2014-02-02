Portfolio2::Application.routes.draw do
  
  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :projects 
  root 'welcome#index'
end
