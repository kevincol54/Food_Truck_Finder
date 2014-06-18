class FoodTruck < ActiveRecord::Base
  belongs_to :company
  has_many :likes
  has_many :users, through: :likes
  geocoded_by :address
  after_validation :geocode 
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :description, :image, :address, presence: true 
  after_save :find_user_and_send_message
  
  enum status: [:closed, :serving]
 

  def current_user_likes_this_truck(current_user)
    current_user.likes.where(food_truck_id: self.id, status: 1)
  end

 

  def find_user_and_send_message
    @users = self.likes.map(&:user) 
    if self.status_changed? && self.status == 'serving'
      @users.each do |user|
        user.send_message(self)
      end
    end
  end
end
