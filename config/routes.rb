Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords' }
  resource :profile, only: [:show]

  resources :organizations, only: [:index, :show]
  resources :glassdoor_employers, only: [:index, :show, :update, :destroy]
  get 'search', to: 'glassdoor_employers#show', as: :search
  root 'welcome#index'
end
