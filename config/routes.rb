Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :categories
  resources :videos

  # Categories
  get '/categories/:id/videos', to: 'categories#videos'

  # Authentication
  post 'login', to: 'authentication#authenticate'

  # Users
  post 'users', to: 'users#create'
end
