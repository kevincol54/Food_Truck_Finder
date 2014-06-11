class AddStatusToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :status, :integer, default: 0
  end
end
