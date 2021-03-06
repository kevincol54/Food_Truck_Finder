class Company < ActiveRecord::Base
  has_many :food_trucks
  has_many :owners
  has_many :users, through: :owners
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => { app_key: ENV['APP_KEY'],
                              app_secret: ENV['APP_SECRET'],
                              access_token: ENV['ACCESS_TOKEN'],
                              access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
                              user_id: ENV['USER_ID'],
                              access_type: 'app_folder'}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, :description, presence: true
end
