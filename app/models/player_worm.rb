class PlayerWorm < ActiveRecord::Base
  belongs_to :player_worm_set
  has_many :worm, dependent: :restrict_with_error
end
