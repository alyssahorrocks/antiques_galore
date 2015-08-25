require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/customer')
require('./lib/item')
require('./lib/purchase')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/sales') do
  @items_available = Item.not_purchased()
  @items_to_purchase = []
  erb(:sales)
end

post('/sales') do
  @items_available = Item.not_purchased()
  @items_to_purchase = []
  checked_items = params.fetch('names')
  checked_items.each() do |item|
    @items_to_purchase.push(Item.find(item))
  end
  erb(:sales)
end

post('/purchased') do
  confirmed_items = params.fetch('confirmations')
  confirmed_purchase = []
  confirmed_items.each() do |item_number|
    confirmed_purchase.push(Item.find(item_number))
  end
  customer = Customer.create({:name => params.fetch('customer')})
  customer.buy(confirmed_purchase)
  erb(:success)
end

get('/owner') do
  erb(:owner_portal)
end

  get('/items') do
    @items_available = Item.not_purchased()
    @items_sold = Item.purchased()
    erb(:item_list)
  end

  post('/items') do
    item_name = params.fetch('item_name')
    item_price = params.fetch('item_price')
    Item.create({:name => item_name, :price => item_price, :purchased => false})

    redirect('/items')
  end

  get('/purchases') do
    @purchases = Purchase.all()
    erb(:purchase_list)
  end
