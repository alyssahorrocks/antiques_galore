require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/customer')
require('./lib/item')
require('./lib/purchase')
require('pg')

get('/') do
  erb(:index)
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
