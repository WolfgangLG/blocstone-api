Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  resource :profile, only: [:show]

  resources :organizations
  root 'welcome#index'
end
