FactoryGirl.define do
  factory :tracker do
    name Faker::Name.name
    purpose Faker::Seinfeld.quote
    partner Faker::Seinfeld.character
    user 
  end
end
