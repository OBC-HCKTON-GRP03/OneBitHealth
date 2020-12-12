# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :appointments do
    resources :exams
    resources :treatments
  end
  
  get 'home', to: 'home#index'
  
  get '/dashboard', to: 'dashboard#index'
  get 'shared_history', to: 'dashboard#users_sharing_with_me'
  
  devise_for :users
  get '/user' => 'dashboard#index', :as => :user_root

  ## Essas linha de codigo tem que esta por ultimo.
  get 'fatal_test', to: 'errors#fatal_test'
  get 'error_test', to: 'errors#error_test'

  match '*path', to: 'errors#not_found', via: :all
  ##

end
