FactoryGirl.define do
  sequence :username do |n|
    "Testusername#{n}"
  end

  factory :user do
    firstname 'Testfirstname'
    lastname 'Testlastname'
    username { generate :username }
    password_digest 'Testpassworddigest'
    email 'test@test.com'
    created_at Time.now
    updated_at nil
  end
end
