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

  %w(Country Coupon Rating OrderItem Category Author Address).each do |m|
    config.model m do 
      list do 
        include_all_fields
        exclude_fields :created_at, :updated_at
      end
    end
  end

  config.model 'User' do
    list do
      include_fields :id, :email, :billing_address, :shipping_address, :orders
    end
  end

  config.model 'Book' do
    list do
      include_all_fields
      exclude_fields :created_at, :updated_at, :order_items, :ratings
    end
  end

  config.model 'Order' do
    list do
      include_all_fields
      exclude_fields :created_at, :updated_at
    end

    edit do
      include_fields :completed_date, :order_total

      field :state, :enum do
        enum do
          bindings[:object].aasm.states(:permitted => true).map(&:name)
        end
      end
    end
  end

end
