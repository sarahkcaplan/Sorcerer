Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Favorites routes
  resources :resources do
    resources :favorites, only: [:create, :destroy]
  end
  
  root to: "resources#index"
  
  #Sessions routes
  resources :sessions, only: [:create, :new]
  delete 'sessions', to: 'sessions#logout'
  
  #Users routes
  resources :users
<<<<<<< HEAD
  resources :resources
=======
  
  #Resources routes
  resources :resources

>>>>>>> 06188bfa57279111e5a144c5eee8e1eb0802bc18
end
