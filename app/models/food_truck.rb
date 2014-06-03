class FoodTruck < ActiveRecord::Base
  belongs_to :eatable, polymorphic: true
  has_many :users
end
