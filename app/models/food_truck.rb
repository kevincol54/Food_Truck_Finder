class FoodTruck < ActiveRecord::Base
  belongs_to :company
  has_many :likes
  has_many :users, through: :likes
  geocoded_by :address
  after_validation :geocode 
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  enum status: [:closed, :serving]
 

 def current_user_likes_this_truck(current_user)
  current_user.likes.where(food_truck_id: self.id)
 end
end
