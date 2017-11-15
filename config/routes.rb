Rails.application.routes.draw do
	root 'users#new'

	resources :posts
	get 'signup', to: 'users#new'

	resources :users, except: [:new]

	get 'login' => 'sessions#new'
	post 'login' => 'sessions#create'
	delete 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
