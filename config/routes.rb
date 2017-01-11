Rails.application.routes.draw do
  root to: 'reads#index'
  resources :reads
end
