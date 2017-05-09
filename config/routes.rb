Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resource :profile, only: [:show]
end
