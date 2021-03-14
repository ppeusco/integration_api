# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # namespace the controllers without affecting the URI
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :clients, only: %i[show index] do
      resources :transactions, only: %i[show index]
      resources :payments, only: %i[show index]  do
        collection do
          get 'pending'
          get 'received'
        end
      end
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
