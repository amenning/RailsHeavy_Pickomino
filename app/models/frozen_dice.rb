class FrozenDice < ActiveRecord::Base
  belongs_to :frozen_dice_set
  has_many :dice, dependent: :restrict_with_error
end
