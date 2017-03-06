class Roll
  include Interactor

  def call
    @context = context
    fill_active_dice_set
  end

  def fill_active_dice_set
    @dice_set = @context.active_dice_set
    @dice_set.save
    fill_dice_set_with_random_active_dice
  end

  def fill_dice_set_with_random_active_dice
    @context.active_dice.map do |active_dice|
      set_active_die(active_dice)
    end
  end

  def set_active_die(active_dice)
    active_dice.active_dice_set_id = @dice_set.id
    active_dice.save
    set_die_value(active_dice)
  end

  def set_die_value(active_dice)
    dice = @context.dice.pop
    dice.create_random_dice
    dice.active_dice_id = active_dice.id
    dice.save
  end
end
