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
  
  #Resources routes
  resources :resources

end
