# frozen_string_literal: true

Rails.application.routes.draw do
  resources :appointments do
    resources :exams
    resources :treatments
  end
  root 'home#index'
  get 'home', to: 'home#index'
  get 'fatal_test', to: 'errors#fatal_test'
  get 'error_test', to: 'errors#error_test'

  match '*path', to: 'errors#not_found', via: :all

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
