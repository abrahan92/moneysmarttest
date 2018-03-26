Rails.application.routes.draw do
  
  match 'users/:id/urls/:id/stats', to: UrlsController.action(:stats), via: :get
  get "/:short_url", to: "urls#show"
  root to: 'visitors#index'
  devise_for :users
  resources :users do
  	resources :urls
  end
end
