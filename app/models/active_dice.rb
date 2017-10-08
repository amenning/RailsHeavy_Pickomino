class ActiveDice < ActiveRecord::Base
  belongs_to :active_dice_set
  has_many :dice, dependent: :destroy
end
