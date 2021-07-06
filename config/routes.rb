Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users
  resources :posts, only: %i[create destroy] do
    resources :likes
    resources :comments
  end

  root 'static#home'
end
