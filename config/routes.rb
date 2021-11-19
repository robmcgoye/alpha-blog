Rails.application.routes.draw do
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resource :users, except: [:new]

end
