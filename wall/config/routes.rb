Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'posts#home'

	get '/login' => 'users#index'
	# get '/login' => 'users#login'  # (reserve 'index' for list of all users)

	post '/login' => 'users#login'

	post '/register' => 'users#register'
	# post '/users' => 'users#create'

	get '/home' => 'posts#home'
	# get '/posts' => 'posts#index'

	post '/new/:message_id' => 'posts#create_comment'
	# post '/posts/:post_id/comments' => 'comments#create'

	post '/messages/create' => 'posts#create_message'
	# post '/posts' => 'posts#create'

	get 'users/logout' => 'users#logout'

end
