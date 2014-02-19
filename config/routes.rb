Portfolio2::Application.routes.draw do
 scope ':locale' do 
  resources :posts do
    resources :comments
  end

  resources :projects do
    :comments
  end
    
   
 end
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root 'welcome#index'
end
