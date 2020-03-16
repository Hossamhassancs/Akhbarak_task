Rails.application.routes.draw do
  resources :articles
  get '/crawl', to: 'articles#crawl'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

end
