class ActiveDiceSet < ActiveRecord::Base
  belongs_to :game
  has_many :active_dice, dependent: :restrict_with_error
  has_many :dice, through: :active_dice
end
