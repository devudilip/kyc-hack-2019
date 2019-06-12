Rails.application.routes.draw do
  resources :products
  devise_for :users
  root "baskets#index"

  resources :baskets do
  	collection do
  	  get "list"
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
