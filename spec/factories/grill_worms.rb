FactoryGirl.define do
  factory :grill_worm do
    grill
    can_take 1
    is_dead 0
    created_at Time.now
    updated_at nil
  end
end
