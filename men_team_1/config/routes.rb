Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :pairings

root to: 'users#index' #set home to index
# get '/pairings', to: 'pairings#index'
# get '/pairings/:id', to: 'pairings#show', as:'show'
#get '/pairings/:id/request', to: 'pairings#request', as: 'request'

end

