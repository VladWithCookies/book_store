Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get "/" => "books#home"
  root "books#home"

  resources :books do
    get :add_rating, on: :member
  end
  
  resources :ratings
  resources :order_items

  get "categories/:category" => "categories#category"

  get "/cart" => "order_items#index"
  delete "/cart/empty" => "order_items#empty_cart"

  get   "/checkout/address" => "checkouts#address"
  post  "/checkout/address" => "checkouts#address_confirm"

  get   "/checkout/delivery" => "checkouts#delivery"
  post  "/checkout/delivery" => "checkouts#delivery_confirm"

  get   "/checkout/payment" => "checkouts#payment"
  post  "/checkout/payment" => "checkouts#payment_confirm"

  get "/checkout/confirm"   => "checkouts#confirm"
  get "/checkout/complete"  => "checkouts#complete"
end
