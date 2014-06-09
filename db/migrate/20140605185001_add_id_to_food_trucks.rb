class AddIdToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :company_id, :integer
  end
end
