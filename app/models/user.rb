class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :owners
  has_many :companies, through: :owners
  has_many :likes
  has_many :food_trucks, through: :likes
  accepts_nested_attributes_for :companies


  USER_TYPE = [
    "Company",
    "Foodie"
  ]


  def send_message    
    CLIENT.account.messages.create(
      :from => '+18035724267',
      :to => '+18034682388',
      :body => '#{self.name}...is now serving food. They are located at #{self.address}. Eat Up!'
    )    
  end  
end
