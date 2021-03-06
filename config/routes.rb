Portfolio2::Application.routes.draw do
#scope ":locale" do
  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end
#end
    
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root 'welcome#index'

  match 'contact' => 'contact#new', via: :get
  match 'contact' => 'contact#create', via: :post
end
