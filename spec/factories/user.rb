FactoryGirl.define do 
  factory :user do
    name                  "Mark Brown"
    email                 "mbrown@yahoo.com"
    password              "foobarrr"
    password_confirmation "foobarrr"
  end
end