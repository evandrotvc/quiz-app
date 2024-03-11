require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root to: 'questions#index'

  resources :questions, except: :destroy
end
