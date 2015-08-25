class Customer < ActiveRecord::Base
  has_many(:purchases)

  define_method(:buy) do |items|
    total_cost = 0
    purchases = []

    items.each() do |item|
      total_cost += item.price
      item.update({:purchased => true})
    end

    items.each() do |item|
      purchases.push(Purchase.create({:customer_id => self.id, :item_id => item.id, :cost => total_cost}))
    end

    purchases
  end
end
