class AddActiveDaysToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :active_days, :string, array: true, default: []
  end
end
