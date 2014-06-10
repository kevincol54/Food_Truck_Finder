class Company < ActiveRecord::Base
  has_many :food_trucks
  has_many :owners
  has_many :users, through: :owners
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
