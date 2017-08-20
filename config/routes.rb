Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :categories
      resources :posts
      resources :confirmations, only: [:create] 
      resources :sessions, only: [:create, :destroy_user] do
        get :destroy_user, on: :collection
      end
    end
  end

  root 'home#index'
  get 'home/index'
  resources :posts
  # devise_for :users, controllers: { confirmations: 'confirmations', sessions: "user/sessions" }
  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # mount V1::User::Registrations => '/api'
end
