require 'rails_helper'

RSpec.describe FoodTruck, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  test "food_truck attributes must not be empty" do
    food_truck = FoodTruck.new
    assert food_truck.invalid?
    assert food_truck.errors[:name].any?
    assert food_truck.errors[:address].any?
    assert food_truck.errors[:description].any?
  end
end
