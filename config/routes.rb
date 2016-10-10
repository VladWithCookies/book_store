Rails.application.routes.draw do
  namespace :users do
    get 'omniauth_callbacks/facebook'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { omniauth_callbacks: "callbacks" }
  get "/" => "pages#home"
  scope path: "/:locale", locale:  /en|ru/, defaults: { locale: 'en' } do
    root "pages#home"

    resources :ratings, only: [:create]
    resources :orders
    resources :order_items
 
    resources :addresses do
      post :update_billing, on: :member
      post :update_shipping, on: :member
    end

    resources :books do
      resources :ratings, only: [:new]
    end

    resources :profiles do 
      patch :update_password, on: :member
    end

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

    post "/add_coupon" => "order_items#add_coupon"

    post "update" => "order_items#update"
  end
end
