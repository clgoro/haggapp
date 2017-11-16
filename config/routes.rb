Rails.application.routes.draw do
	root 'users#new'

	resources :posts
	get 'signup', to: 'users#new'

	resources :users, except: [:new]

	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	get 'logout' => 'sessions#destroy'
 end
