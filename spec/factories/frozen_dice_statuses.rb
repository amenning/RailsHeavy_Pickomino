FactoryGirl.define do
  factory :frozen_dice_status do
    game
    total 0
    has_worm 0
    created_at Time.now
    updated_at nil
  end
end
