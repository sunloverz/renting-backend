class AddPriceFieldsToRents < ActiveRecord::Migration[5.2]
  def change
    add_column :rents, :total_price, :integer
    add_column :rents, :subtotal_price, :integer
  end
end
