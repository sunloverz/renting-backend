class RemoveFieldsFromRents < ActiveRecord::Migration[5.2]
  def change
    remove_column :rents, :price, :integer
    remove_column :rents, :rent_type, :string
  end
end
