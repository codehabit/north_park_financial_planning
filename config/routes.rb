Rails.application.routes.draw do
  devise_for :admins
  resources :accounts, only: [:new, :create, :show]
  get "/about", to: "about#index", as: :about

  namespace :admin do
    resources :contents
  end

  root to: "home#index", as: :home
end
