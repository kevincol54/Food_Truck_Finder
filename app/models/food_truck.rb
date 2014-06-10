class FoodTruck < ActiveRecord::Base
  belongs_to :company
  has_many :users
  geocoded_by :address
  after_validation :geocode 
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  

  
end
