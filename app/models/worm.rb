class Worm < ActiveRecord::Base
  has_many :player_worm, dependent: :restrict_with_error
  has_many :grill_worm, dependent: :restrict_with_error
end
