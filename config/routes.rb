Rails.application.routes.draw do
	get 'users/new'
	root 'users#new'

	resources :posts
	get 'signup', to: 'users#new'

	resources :users, except: [:new]

	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	get 'logout' => 'sessions#destroy'

	get 'facebook' => 'facebook#accept_token'
  # get 'posts/index'
  #
  # get 'posts/create'

  get 'tags/:tag', to: 'posts#index', as: "tag"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
