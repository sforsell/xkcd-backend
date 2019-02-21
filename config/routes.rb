Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # create user
  post '/users' => 'users#create'
  # get favorites
  get '/users/:user_id' => 'users#show'
  # create favorite
  post '/users/:user_id/comics' => 'comics#create'
  # remove favorite
  delete '/users/:user_id/comics/:id' => 'comics#destroy'
  
end
