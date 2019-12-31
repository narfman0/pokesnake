Rails.application.routes.draw do
  get 'welcome/index'
  resources :pokemon
  root 'welcome#index'
  get 'api/update', to: 'pokemon#update_job'
end
