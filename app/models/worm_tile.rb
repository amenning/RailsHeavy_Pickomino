class WormTile < ActiveRecord::Base
  belongs_to :image
  belongs_to :theme
end
