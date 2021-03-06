require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clients, only: [:show, :index] do
    resources :transactions, only: [:show, :index]
    resources :payments, only: [:show, :index]
  end
  
  mount Sidekiq::Web => '/sidekiq'
end
