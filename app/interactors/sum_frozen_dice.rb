class SumFrozenDice
  include Interactor

  def call
    @frozen_dice_set = FrozenDiceSet.last
    context.frozen_dice_sum = get_sum_of_frozen_dice
  end

  private

  def get_sum_of_frozen_dice
    ActiveRecord::Base.transaction do
      @frozen_dice_set.frozen_dice.all.to_a.reduce(0) do |sum, frozen_dice|
        value = frozen_dice.dice.last.value.to_i
        sum + (value == 6 ? 5 : value)
      end
    end
  end
end
