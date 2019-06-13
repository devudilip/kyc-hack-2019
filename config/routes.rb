Rails.application.routes.draw do
  resources :products 
  resources :budget do 
    collection do
      post 'save_prod'
      post 'destroy_prod'
    end  
  end  
  devise_for :users
  root "budget#new"
  #root "baskets#index"

  resources :baskets do
  	collection do
  	  get "list"
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
