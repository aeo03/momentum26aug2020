Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"
  
  resources :quotations, :creators

  get 'signup', to: 'users#new', as: 'new_user'
  resources :users, except: [:new]
  
  get 'login', to: 'sessions#new', as: 'login_user'
  post 'auth', to: 'sessions#create', as: 'auth_user'
  delete 'logout', to: 'sessions#destroy', as: 'logout_user'
end
