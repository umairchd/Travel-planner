Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "homes#index"
  resources :user do
    get '/generate_routes', to: 'locations#calculate_routes'
    get '/routes', to: 'routes#index'
    resources :locations
  end

end
