class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:customer_id, :integer)
      t.column(:item_id,  :integer)
      t.column(:cost, :integer)

      t.timestamps
    end
  end
end
