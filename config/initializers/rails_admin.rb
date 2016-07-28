RailsAdmin.config do |config|

  config.excluded_models = ["Checkout", "CreditCard"]

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'Address' do
    list do
      field :id
      field :firstname
      field :lastname
      field :street
      field :zipcode
      field :city
      field :phone
      field :country  
    end
  end

  config.model 'Author' do
    list do
      field :id
      field :firstname
      field :lastname
      field :description
      field :books
    end
  end

  config.model 'Book' do
    list do
      field :id
      field :title
      field :image
      field :description
      field :short_description
      field :price
      field :in_stock
      field :categories
      field :authors
    end
  end

  config.model 'Category' do
    list do
      field :id
      field :title
      field :books
    end
  end

  config.model 'Category' do
    list do
      field :id
      field :title
      field :books
    end
  end

  config.model 'Order' do
    list do
      field :id
      field :order_total
      field :shipping
      field :item_total
      field :discount
      field :completed_date
      field :state
      field :user
      field :billing_address
      field :shipping_address
      field :coupons
      field :order_items
    end
  end

  config.model 'OrderItem' do
    list do
      field :id
      field :price
      field :quantity
      field :book
      field :order
    end
  end

  config.model 'Rating' do
    list do
      field :id
      field :text
      field :rating
      field :approval
      field :user
      field :book
    end
  end

  config.model 'User' do
    list do
      field :id
      field :email
      field :orders
      field :billing_address
      field :shipping_address
    end
  end

  config.model 'Coupon' do
    list do
      field :id
      field :code
      field :expires_at
      field :starts_at
      field :discount
      field :used
    end
  end

  config.model 'Country' do
    list do
      field :id
      field :name
    end
  end

end
