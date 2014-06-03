class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :food_trucks, as: :eatable
  has_many :companies, through: :owners
  has_many :food_trucks, through: :likes
end
