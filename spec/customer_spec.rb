require('spec_helper')

describe(Customer) do
  describe('#buy') do
    it('connects a purchaser with an item throuth the creation of a new instance of the Purchase class') do
      customer1 = Customer.create({:name => "Walter White"})
      item1 = Item.create({:name => "Bunsen Burner", :price => 100, :purchased => false})
      purchase1 = customer1.buy([item1])
      expect(customer1.purchases()).to(eq(purchase1))
    end
  end

  describe('#purchases') do
    it('returns all purchases of a given instance of the Customer class') do
      customer1 = Customer.create({:name => "Walter White"})
      expect(customer1.purchases()).to(eq([]))
    end

    it('returns all purchases of a given instance of the Customer class') do
      customer1 = Customer.create({:name => "Walter White"})
      item1 = Item.create({:name => "Bunsen Burner", :price => 100, :purchased => false})
      purchase1 = customer1.buy([item1])
      expect(customer1.purchases()).to(eq(purchase1))
    end
  end
end
