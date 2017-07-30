FactoryGirl.define do
  factory :player_option do
    game
    can_roll 1
    bunk 0
    is_game_over 0
    created_at Time.now
    updated_at nil
  end
end
