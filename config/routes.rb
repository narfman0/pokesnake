Rails.application.routes.draw do
  get 'welcome/index'
  resources :pokemon
  root 'welcome#index'
end
