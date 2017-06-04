class SetupActiveDice
  include Interactor

  def call
    @number_of_active_dice = context.number_of_active_dice
    @active_dice_set = context.active_dice_set
    associate_worm_active_dice_with_active_dice_set
  end

  private

  def associate_worm_active_dice_with_active_dice_set
    @number_of_active_dice.times do
      active_dice = @active_dice_set.active_dice.create(can_freeze: false)
      active_dice.dice.create(value: 6)
    end
  end
end
