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

  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]

  # https://stackoverflow.com/questions/48733512/how-do-i-mount-a-standalone-rack-app-into-a-ruby-on-rails-app
  mount XKCDProxy.new => '/xkcd'

end
