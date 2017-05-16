Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/login' => 'users#index'

post '/login' => 'users#login'

post '/register' => 'users#register'

get '/home' => 'posts#home'

post '/new/:message_id' => 'posts#create_comment'

post '/messages/create' => 'posts#create_message'

get 'users/logout' => 'users#logout'

end
