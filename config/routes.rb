Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :books do
  	resources :reservations
  end
  root 'books#index'
  post '/books/find' => 'books#find'
  post '/books/books/find' => 'books#find'
end
