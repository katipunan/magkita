Rails.application.routes.draw do
  get 'welcome/index'

  resources :communities
  
  root 'welcome#index'
end
