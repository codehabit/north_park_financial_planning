Rails.application.routes.draw do
  resources :accounts, only: [:new, :create, :show]
  get "/about", to: "about#index", as: :about
  root to: "home#index", as: :home
end
