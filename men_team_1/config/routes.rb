Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :topics
resources :pairings
resources :posts do
  resources :comments
end

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'


root to: 'users#index' #set home to index

end
