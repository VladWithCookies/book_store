namespace :orders do
  desc "Cleanup orders in progress"
  task clean_up: :environment do
    Order.where(state: 'in_progress').delete_all
  end
end
