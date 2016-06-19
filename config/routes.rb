Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get "/", to: "books#home"
  root "books#home"

  resources :books do
    member do
      get :add_rating
    end
  end
  
  resources :ratings

end
