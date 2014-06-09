class AddLocToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :latitude, :float
    add_column :food_trucks, :longitude, :float
    add_column :food_trucks, :address, :string
  end
end
