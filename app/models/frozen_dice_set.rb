class FrozenDiceSet < ActiveRecord::Base
  belongs_to :game
  has_many :frozen_dice, dependent: :restrict_with_error

  def all_frozen_dice
    frozen_dice.all.to_a
  end
end
