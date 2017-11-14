Rails.application.routes.draw do
  # get 'posts/index'
  #
  # get 'posts/create'

  get 'tags/:tag', to: 'posts#index', as: "tag"
  resources :posts, only: [:create]
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
