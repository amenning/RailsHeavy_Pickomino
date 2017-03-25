class SumFrozenDice
  include Interactor

  def call
    @frozen_dice_set = context.frozen_dice_set
    context.frozen_dice_sum = frozen_dice_sum
  end

  private

  def frozen_dice_sum
    @frozen_dice_set.frozen_dice.all.to_a.reduce(0) do |sum, frozen_dice|
      value = frozen_dice.dice.last.value.to_i
      sum + (value == 6 ? 5 : value)
    end
  end
end
