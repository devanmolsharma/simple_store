Rails.application.routes.draw do
  root "products#index"

  get "/articles", to: "articles#index"

  resources :products

  get "up" => "rails/health#show", as: :rails_health_check

end
