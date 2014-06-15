# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food_truck do
    name { Faker::Company.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    
  end
end
