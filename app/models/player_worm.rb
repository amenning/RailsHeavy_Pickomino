class PlayerWorm < ActiveRecord::Base
  belongs_to :player
  belongs_to :game_state
  belongs_to :worm
end
