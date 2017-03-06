class Roll
  include Interactor

  def call
    @context = context
    active_dice_set = @context.active_dice_set
    active_dice_set.save
    associate_active_dice_with_active_dice_set
    determine_random_dice_value_and_associate_with_an_active_dice
  end

  def associate_active_dice_with_active_dice_set
    @context.active_dice_objects.map do |active_dice|
      active_dice.active_dice_set_id = @context.active_dice_set.id
      active_dice.save
    end
  end

  def determine_random_dice_value_and_associate_with_an_active_dice
    @context.dice_objects.each do |dice|
      dice.create_random_dice
      dice.active_dice_id = @context.active_dice_objects.pop.id
      dice.save
    end
  end
end
