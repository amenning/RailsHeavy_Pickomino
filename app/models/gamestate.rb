class Gamestate < ActiveRecord::Base
  belongs_to :game
  belongs_to :phase
  belongs_to :player
end
