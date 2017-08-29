FactoryGirl.define do
  factory :tracker do
    name Faker::Name.name
    purpose Faker::Book.genre
  end
end
