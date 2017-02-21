class Grill < ActiveRecord::Base
  belongs_to :game_state
  belongs_to :grill_worm_tiles
end
