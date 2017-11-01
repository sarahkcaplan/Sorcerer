Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#Sessions routes
  resources :sessions, only: [:create, :new]
  delete 'sessions', to: 'sessions#logout'
  resources :users

end
