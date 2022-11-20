Rails.application.routes.draw do
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "crawler#index"
  resources :crawler
  resources :category
end
