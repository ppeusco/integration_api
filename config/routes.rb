# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clients, only: %i[show index] do
    resources :transactions, only: %i[show index]
    resources :payments do
      collection do
        get 'pending'
        get 'received'
      end
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
