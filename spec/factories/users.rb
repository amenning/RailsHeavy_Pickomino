FactoryGirl.define do
  sequence :username do |n|
    "Testusername#{n}"
  end

  factory :user do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    username { generate :username }
    password Faker::Name.name
    email 'test@test.com'
    created_at Time.now
    updated_at nil
  end
end
