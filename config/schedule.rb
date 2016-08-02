every :sunday, :at => '5am' do
  rake "orders:clean_up"
end