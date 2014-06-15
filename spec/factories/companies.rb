# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    description { Faker::Lorem.sentences(1) }
  end
end
