Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"

  resources :registry_items
  resources :photos
end
