class ActiveDice < ActiveRecord::Base
  belongs_to :active_dice_set
  belongs_to :dice
end
