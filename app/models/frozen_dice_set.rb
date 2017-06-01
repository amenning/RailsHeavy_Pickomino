class FrozenDiceSet < ActiveRecord::Base
  belongs_to :game
  has_many :frozen_dice, dependent: :restrict_with_error

  def all_frozen_dice_values_with_worms_converted
    frozen_dice.all.to_a.map(&:dice_value)
  end

  def all_raw_frozen_dice_values
    frozen_dice.all.to_a.map do |frozen_dice|
      frozen_dice.dice.last.value
    end
  end
end
