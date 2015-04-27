Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'login', to: 'sessions#new'
  resource :session, only: [:create, :destroy]
  resources :parties, only: [:index]

  namespace :api, defaults: {format: :json} do
    resources :parties
    resources :guests
  end
end
