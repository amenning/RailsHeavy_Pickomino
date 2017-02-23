class PlayerWorm < ActiveRecord::Base
  belongs_to :player_worm_set
  belongs_to :worm
end
