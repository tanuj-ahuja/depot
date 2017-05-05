Rails.application.routes.draw do
  resources :lines do
  	 post 'decrement', on: :member
  	end

  resources :carts
  root 'store#index'
  #post '/decrement', to: 'lines#decrement'
   


  resources :products 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
