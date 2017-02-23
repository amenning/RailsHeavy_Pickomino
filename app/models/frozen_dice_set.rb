class FrozenDiceSet < ActiveRecord::Base
  belongs_to :game
  has_many :frozen_dice, dependent: :restrict_with_error
end
