Rails.application.routes.draw do
  root to: 'questions#index'

  resources :categories, only: [:index]
  resources :rounds, only: %i[show create] do
    member do
      get :result
      post :answers
    end
  end
end
