Rails.application.routes.draw do
  resources :categories
  resources :videos

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # Categories
  get '/categories/:id/videos', to: 'categories#videos'
end
