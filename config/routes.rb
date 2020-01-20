Rails.application.routes.draw do
	resources :users, param: :_username
	resources :featured_blogs
	resources :blogs
	resources :categories
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
