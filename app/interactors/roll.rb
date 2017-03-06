class Roll
  include Interactor

  def call
    @number_of_active_dice = context.number_of_active_dice
    @dice_set = ActiveDiceSet.new
    context.dice_set = @dice_set
    create_active_dice_set
  end

  def create_active_dice_set
    @dice_set.save
    fill_dice_set_with_random_active_dice
  end

  def fill_dice_set_with_random_active_dice
    @number_of_active_dice.times do
      create_active_die
    end
  end

  def create_active_die
    @active_dice = ActiveDice.new
    @active_dice.active_dice_set_id = @dice_set.id
    @active_dice.save
    create_die_value
  end

  def create_die_value
    @dice = Dice.new
    @dice.create_random_dice
    @dice.active_dice_id = @active_dice.id
    @dice.save
  end
end
