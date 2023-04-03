Rails.application.routes.draw do
  resources :categories
  resources :videos

  # Categories
  get '/categories/:id/videos', to: 'categories#videos'

  # Authentication
  post 'login', to: 'authentication#authenticate'

  # Users
  post 'users', to: 'users#create'
end
