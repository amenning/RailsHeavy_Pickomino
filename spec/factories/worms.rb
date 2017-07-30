FactoryGirl.define do
  sequence :value do |x|
    "#{x}"
  end

  factory :worm do
    value { generate :value }
    worm_count 3
    grill_worm
    player_worm_id nil
    created_at Time.now
    updated_at nil
  end
end
