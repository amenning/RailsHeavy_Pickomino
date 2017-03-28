FactoryGirl.define do
  factory :frozen_dice do
    frozen_dice_set
    created_at Time.now
    updated_at nil
  end
end
