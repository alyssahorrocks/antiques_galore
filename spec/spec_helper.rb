ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('pg')
require('customer')
require('item')
require('purchase')

RSpec.configure do |config|
  config.after(:each) do
    Customer.all.each do |customer|
      customer.destroy
    end
    Item.all.each do |item|
      item.destroy
    end
    Purchase.all.each do |purchase|
      purchase.destroy
    end
  end

end
