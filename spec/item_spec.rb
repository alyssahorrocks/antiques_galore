require("spec_helper")

describe('Item') do
  describe('#buyer') do
    it('return the customer who bought a given instance of an item') do
      item1 = Item.create({:name => "Plastic Bins", :price => 35, :purchased => false})
      customer1 = Customer.create({:name => "Jessie Pinkman"})
      customer1.buy([item1])
      expect(item1.buyer()).to(eq("Jessie Pinkman"))
    end
  end
end
