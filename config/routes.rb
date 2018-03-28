Rails.application.routes.draw do
  resources :accounts, only: [:new, :create, :show]
  root to: "home#index"
end
