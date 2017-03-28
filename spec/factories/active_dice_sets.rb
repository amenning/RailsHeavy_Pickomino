FactoryGirl.define do
  factory :active_dice_set do
    game
    created_at Time.now
    updated_at nil
  end
end
