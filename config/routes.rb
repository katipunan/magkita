Rails.application.routes.draw do
  get 'welcome/index'

  resources :communities, only: :show
  
  root 'welcome#index'
end
