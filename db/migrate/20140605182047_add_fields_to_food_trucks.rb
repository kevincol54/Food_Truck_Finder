class AddFieldsToFoodTrucks < ActiveRecord::Migration
  def self.up
    add_attachment :food_trucks, :image
  end

  def self.down
    remove_attachment :food_trucks, :image
  end
end
