Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'login', to: 'sessions#new'
  resource :session, only: [:create, :destroy]
  resources :parties, only: [:index]
  get 'rsvp', to: 'rsvps#index'

  namespace :api, defaults: {format: :json} do
    resources :parties
    resources :guests
    resources :rsvps
    resources :guest_rsvps
    get 'parties/:id/invite', to: 'parties#invite'
  end
end
