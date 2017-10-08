class ActiveDiceSet < ActiveRecord::Base
  belongs_to :game
  has_many :active_dice, dependent: :destroy
  has_many :dice, through: :active_dice
end
