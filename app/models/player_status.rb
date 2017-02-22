class PlayerStatus < ActiveRecord::Base
  belongs_to :game_state
  belongs_to :player
end
