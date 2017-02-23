class FrozenDice < ActiveRecord::Base
  belongs_to :frozen_dice_set
  belongs_to :dice
end
