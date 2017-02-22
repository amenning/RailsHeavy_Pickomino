class FrozenDiceSet < ActiveRecord::Base
  belongs_to :game_state
  belongs_to :dice
end
