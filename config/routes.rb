Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :questions, only: [:create] do
        post 'check', on: :member
      end
      resources :words do
        get 'random_word', on: :collection
      end
      get '/users/me', to: 'users#me'
      get 'translate', to: 'translations#translate'
    end
  end
end
