class AddDurationToRents < ActiveRecord::Migration[5.2]
  def change
    add_column :rents, :duration, :integer
  end
end
