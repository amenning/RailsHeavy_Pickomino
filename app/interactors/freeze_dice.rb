class FreezeDice
  include Interactor

  def call
    @game = context.game
    @dice_value = context.dice_value
    @frozen_dice_set = context.frozen_dice_set
    @active_dice_set = current_active_dice_set
    if verify_active_dice_set_has_value && verify_frozen_dice_set_does_not_have_value
      move_dice_from_active_to_frozen
      update_frozen_dice_status_if_freezing_worm if @dice_value == 6
    end
  end

  private

  def current_active_dice_set
    ActiveDiceSet.joins(:game).where(games: { id: @game }).last
  end

  def verify_active_dice_set_has_value
    0 < @active_dice_set.active_dice.all.to_a.reduce(0) do |count, active_dice|
      count + (active_dice.dice.last.value == @dice_value ? 1 : 0)
    end
  end

  def verify_frozen_dice_set_does_not_have_value
    0 === @frozen_dice_set.frozen_dice.all.to_a.reduce(0) do |count, frozen_dice|
      unless frozen_dice.dice.last.nil?
        count + (frozen_dice.dice.last.value == @dice_value ? 1 : 0)
      end
    end
  end

  def move_dice_from_active_to_frozen
    @active_dice_set.active_dice.all.to_a.map do |active_dice|
      dice = active_dice.dice.last
      next unless dice.value == @dice_value
      create_new_frozen_dice_and_associate_with_dice(dice)
      unassociated_active_dice_and_destroy(active_dice, dice)
    end
  end

  def create_new_frozen_dice_and_associate_with_dice(dice)
    frozen_dice = @frozen_dice_set.frozen_dice.create
    dice.frozen_dice_id = frozen_dice.id
    dice.save
  end

  def unassociated_active_dice_and_destroy(active_dice, dice)
    dice.active_dice_id = nil
    dice.save
    active_dice.destroy
  end

  def update_frozen_dice_status_if_freezing_worm
    frozen_dice_status = FrozenDiceStatus.joins(:game).where(games: { id: @game }).last
    frozen_dice_status.has_worm = true
    frozen_dice_status.save
  end
end
