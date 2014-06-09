class FoodTruck < ActiveRecord::Base
  belongs_to :company
  has_many :users
  has_attached_file :image, :styles => {:thumb => "100x100#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
