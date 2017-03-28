FactoryGirl.define do
  factory :player do
    user
    created_at Time.now
    updated_at nil
  end
end
