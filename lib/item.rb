class Item < ActiveRecord::Base
  belongs_to(:purchases)

  define_method(:buyer) do
    purchase = Purchase.where(item_id: self.id).first
    Customer.find(purchase.customer_id).name()
  end

  scope(:purchased, -> do
    where({:purchased => true})
  end)

  scope(:not_purchased, -> do
    where({:purchased => false})
  end)
end
