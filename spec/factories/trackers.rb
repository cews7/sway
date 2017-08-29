FactoryGirl.define do
  factory :tracker do
    name Faker::Name.name
    purpose Faker
    partner "MyString"
    user nil
  end
end
