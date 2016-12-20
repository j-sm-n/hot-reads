Rails.application.routes.draw do
  root to: 'reads#index'
  resources :reads, only: [:index]
  namespace :api do
    namespace :v1 do
      resource :reads, only: [:create]
    end
  end
end
