Rails.application.routes.draw do
  root to: 'static_pages#home'
  resource :session, only: [:new, :create, :destroy]
end