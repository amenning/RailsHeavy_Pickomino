class GrillWormTile < ActiveRecord::Base
  belongs_to :grill
  belongs_to :worm
end
