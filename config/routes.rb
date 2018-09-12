Rails.application.routes.draw do

  resources :user, only: [:update, :destroy]

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	get 'dashboard', to: 'pages#dashboard'

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
