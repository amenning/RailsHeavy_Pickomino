class SumFrozenDice
  include Interactor

  def call
    @game = context.game
    @frozen_dice_values = context.frozen_dice_values
    context.frozen_dice_sum = frozen_dice_sum
    frozen_dice_status = FrozenDiceStatus.joins(:game).where(games: { id: @game }).last
    frozen_dice_status.total = context.frozen_dice_sum
    frozen_dice_status.save
  end

  private

  def frozen_dice_sum
    @frozen_dice_values.reduce(0) do |sum, dice_value|
      sum + dice_value
    end
  end
end
