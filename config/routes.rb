# frozen_string_literal: true

Rails.application.routes.draw do
  resources :appointments do
    resources :exams
    resources :treatments
  end
  get '/dashboard', to: 'dashboard#index'
  root 'home#index'
  
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
