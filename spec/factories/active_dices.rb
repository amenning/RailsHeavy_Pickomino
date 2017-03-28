FactoryGirl.define do
  factory :active_dice do
    active_dice_set
    can_freeze false
    created_at Time.now
    updated_at nil
  end
end
