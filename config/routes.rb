Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users do
    member do
      get 'friends', to: 'friends#show_friends'       # view all friends
      post 'friends', to: 'friends#create'            # send friend request
      delete 'friends', to: 'friends#destroy'         # unfriend user
      get 'pending', to: 'friends#pending'            # view all pending request for our id only.
      post 'accept', to: 'friends#accept'             # accept some pending request
      delete 'reject', to: 'friends#reject'           # reject some pending request

      # resources :friends, only: %i[create index destroy], param: :friend_id do
      #   member do
      #     post :accept
      #     delete :reject
      #   end
      #   collection do
      #     get :pending
      #   end
      # end
    end
  end
  resources :posts, only: %i[create destroy] do
    resources :likes
    resources :comments
  end

  root 'static#home'
end
