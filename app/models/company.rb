class Company < ActiveRecord::Base
  has_many :food_trucks, as: :eatable
  has_many :owners
  has_many :users, through: :owners 
end
