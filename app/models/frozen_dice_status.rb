class FrozenDiceStatus < ActiveRecord::Base
  belongs_to :game_state
end
