FactoryGirl.define do
  factory :game do
    player
    created_at Time.now
    updated_at nil
  end
end
