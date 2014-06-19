class FoodTruck < ActiveRecord::Base
  belongs_to :company
  has_many :likes
  has_many :users, through: :likes
  geocoded_by :address
  after_validation :geocode 
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => { app_key: ENV['APP_KEY'],
                              app_secret: ENV['APP_SECRET'],
                              access_token: ENV['ACCESS_TOKEN'],
                              access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
                              user_id: ENV['USER_ID'],
                              access_type: 'app_folder'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :description, :address, presence: true 
  after_save :find_user_and_send_message
  
  enum status: [:closed, :serving]
  p 'hey kevin'
  p  ENV['APP_KEY']
  p ENV['APP_SECRET']
  p ENV['ACCESS_TOKEN']
  p ENV['ACCESS_TOKEN_SECRET']
  p ENV['USER_ID']



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
