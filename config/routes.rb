Rails.application.routes.draw do
  
	namespace 'api' do
		namespace 'v1' do
			resources :categories
		end
	end

  root 'home#index'
  get 'home/index'
  resources :posts
  devise_for :users, controllers: { confirmations: 'confirmations', sessions: "user/sessions" }
  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # mount V1::User::Registrations => '/api'
end
