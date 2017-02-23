class PlayerWormSet < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :player_worm, dependent: :restrict_with_error
end
