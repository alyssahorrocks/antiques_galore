class CreateItems < ActiveRecord::Migration
  def change
    create_table(:items) do |t|
      t.column(:name, :string)
      t.column(:price, :integer)
      t.column(:purchased, :boolean)

      t.timestamps
    end
  end
end
