module GamesHelper
  def self.get_active_dice_values(dice_set)
    dice_set.active_dice.map { |active_die| active_die.dice.last.value }
  end

  def self.get_array_of_dice_objects(number_of_active_dice)
    dice = []
    number_of_active_dice.times do
      dice.push(Dice.new)
    end
    dice
  end

  def self.get_array_of_active_dice_objects(number_of_active_dice)
    active_dice = []
    number_of_active_dice.times do
      active_dice.push(ActiveDice.new)
    end
    active_dice
  end
end
