Rails.application.routes.draw do
  resources :products 
  resources :budget do 
    collection do
      post 'save_prod'
    end  
  end  
  devise_for :users
  root "budget#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
