class AddDailyMealToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :daily_meal, :string
  end
end
