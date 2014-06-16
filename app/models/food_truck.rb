class FoodTruck < ActiveRecord::Base
  belongs_to :company
  has_many :likes
  has_many :users, through: :likes
  geocoded_by :address
  after_validation :geocode 
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :description, :image, :address, presence: true 
  
  enum status: [:closed, :serving]
 

 def current_user_likes_this_truck(current_user)
  # p current_user.likes
  # p likes
  # p current_user.likes[0][:status]
  p "*"*100
  current_user.likes.where(food_truck_id: self.id, status: 1)
 end
end
