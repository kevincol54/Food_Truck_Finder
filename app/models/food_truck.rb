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

  def send_message_to_user_who_likes_truck
   
    # if     
      CLIENT.account.messages.create(
        :from => '+18035724267',
        :to => '+18034682388',
        :body => '#{food truck name}...is now serving food. They are located at #{address}. Eat Up!'
        )
    
  end



 # like = Like.all 

 # p User.joins(:likes)
 # p Like.joins(:food_truck => :likes)
 # p Like.joins(:food_truck, :user).where(status: 1)
 # to_message = User.all.where(user.likes )
 # if user likes a food truck & food truck status is serving, send message to user.phone_number
  
 p Like.all
 p "*"*100
 p User.all.map(&:likes)

 p "*"*100
  # p User.last.phone_number



end
