Rails.application.routes.draw do

  post 'users/login', to: 'users#login', as: 'login'
  get 'users/login', to: 'users#new'
  delete 'users/destroy', to: 'users#destroy', as: 'logout'

  root 'main#index'
  resources :works

  get 'users', to: 'users#index', as: 'users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
