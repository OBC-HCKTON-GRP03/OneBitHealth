# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :appointments do
    resources :exams
    resources :treatments
  end
  
  get 'home', to: 'home#index'
  # get 'fatal_test', to: 'errors#fatal_test'
  # get 'error_test', to: 'errors#error_test'

  # match '*path', to: 'errors#not_found', via: :all

  get '/dashboard', to: 'dashboard#index'

  devise_for :users
  get '/user' => 'dashboard#index', :as => :user_root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
