Rails.application.routes.draw do
  root "feeds#index"
  resources :feeds
  resources :entries, only: [:index]
end