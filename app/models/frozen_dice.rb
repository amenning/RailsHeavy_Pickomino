class FrozenDice < ActiveRecord::Base
  belongs_to :frozen_dice_set
  has_many :dice, dependent: :destroy

  def dice_value
    value = dice.last.value.to_i
    max_dice_value = Rails.configuration.x.game_parameters['max_dice_value']
    value == max_dice_value ? (max_dice_value - 1) : value
  end
end
