module GamesHelper
  def self.get_active_dice_values(dice_set)
    dice_set.active_dice.map { |active_die| active_die.dice.last.value }
  end
end
