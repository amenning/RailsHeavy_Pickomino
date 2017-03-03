class Dice < ActiveRecord::Base
  belongs_to :active_dice
  belongs_to :frozen_dice
end
