class SumFrozenDice
  include Interactor

  def call
    @frozen_dice_set = context.frozen_dice_set
    context.frozen_dice_sum = frozen_dice_sum
  end

  private

  def frozen_dice_sum
    @frozen_dice_set.all_frozen_dice.reduce(0) do |sum, frozen_dice|
      sum + frozen_dice.dice_value
    end
  end
end
