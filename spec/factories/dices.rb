FactoryGirl.define do
  factory :dice do
    value 3
    active_dice
    frozen_dice nil
    created_at Time.now
    updated_at nil
  end
end
