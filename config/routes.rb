# frozen_string_literal: true

Rails.application.routes.draw do
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'sessions', only: [:create]

  resources :users, controller: 'users', only: [:create] do
    resource :password,
      controller: 'clearance/passwords',
      only: [:create, :edit, :update]
  end

  get '/sign_in' => 'sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'users#new', as: 'sign_up'

  get 'welcome/index'

  namespace :admin do
    resources :communities, except: :show
    resources :users, only: [:index, :destroy]
  end

  resources :communities, only: :show

  root 'welcome#index'
end
