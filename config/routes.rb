Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  resources :items, only: %i[index]
  get 'items/worth', to: 'items#worth'
  get 'items/paginateditem', to: 'items#paginateditem'
  get 'items/scrap_info', to: 'items#scrapinfo'

  patch 'scraper/seedxp', to: 'scraper#seedxp'
  patch 'scraper/scrap', to: 'scraper#scrap'
end
