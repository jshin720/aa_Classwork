Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get '/users', to: 'users#index', as: 'user_id'
  # post '/users', to: 'users#create', as: 'create_user'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get '/users/:id', to: 'users#show', as: 'user'
  # patch '/users/:id', to: 'users#update', as: 'update_user'
  # put '/users/:id', to: 'users#update', as: 'overwrite_user'
  # delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  # resources :users, only:[:update, :destroy, :index, :show, :create]
  resources :users do 
      resources :artworks, only: [:index]
    end  
  resources :artworks, only:[:update, :destroy, :show, :create]  
  resources :artwork_shares, only:[:create, :index, :show, :destroy]
end
