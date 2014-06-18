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
    current_user.likes.where(food_truck_id: self.id, status: 1)
  end

  def send_message    
    CLIENT.account.messages.create(
      :from => '+18035724267',
      :to => '+18034682388',
      :body => '#{self.name}...is now serving food. They are located at #{self.address}. Eat Up!'
      )    
  end

  def find_user_that_likes_truck
    @users = self.likes.map(&:user) 
    p "*"*100
    p @users
  end
  

 





end
