Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :topics

root to: 'users#index' #set home to index
#change to topics#index , use show for each topic page 
end
