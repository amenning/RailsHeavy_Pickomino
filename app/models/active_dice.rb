class ActiveDice < ActiveRecord::Base
  belongs_to :active_dice_set
  has_many :dice, dependent: :restrict_with_error
end
