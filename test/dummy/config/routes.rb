Dummy::Application.routes.draw do 

  devise_for :users
  resources :products
  resources :materials
  
end
