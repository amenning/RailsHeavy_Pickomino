module FrozenDicesHelper
  def self.get_frozen_dice_hash_after_freeze(dice_value)
    @dice_value = dice_value
    @active_dice_set = ActiveDiceSet.last
    @frozen_dice_set = FrozenDiceSet.last
    if verify_active_dice_set_has_value && verify_frozen_dice_set_does_not_have_value
      move_dice_from_active_to_frozen
    end
    create_frozen_dice_hash
  end

  private

  def self.verify_active_dice_set_has_value
    0 < @active_dice_set.active_dice.all.to_a.reduce(0) do |count, active_dice|
      count + (active_dice.dice.last.value == @dice_value ? 1 : 0)
    end
  end

  def self.verify_frozen_dice_set_does_not_have_value
    0 === @frozen_dice_set.frozen_dice.all.to_a.reduce(0) do |count, frozen_dice|
      unless frozen_dice.dice.last.nil?
        count + (frozen_dice.dice.last.value == @dice_value ? 1 : 0)
      end
    end
  end

  def self.move_dice_from_active_to_frozen
    @active_dice_set.active_dice.all.to_a.map do |active_dice|
      dice = active_dice.dice.last
      next unless dice.value == @dice_value
      create_new_frozen_dice_and_associate_with_dice(dice)
      unassociated_active_dice_and_destroy(active_dice, dice)
    end
  end

  def self.create_new_frozen_dice_and_associate_with_dice(dice)
    frozen_dice = @frozen_dice_set.frozen_dice.create
    dice.frozen_dice_id = frozen_dice.id
    dice.save
  end

  def self.unassociated_active_dice_and_destroy(active_dice, dice)
    dice.active_dice_id = nil
    dice.save
    active_dice.destroy
  end

  def self.create_frozen_dice_hash
    unless @frozen_dice_set.frozen_dice.nil?
      frozen_dice_hash = @frozen_dice_set.frozen_dice.map do |frozen_dice|
        next if frozen_dice.dice.last.nil?
        value = frozen_dice.dice.last.value
        {
          value: value,
          image: ImagesHelper.get_dice_image(value)
        }
      end
      frozen_dice_hash.compact
    end
  end
end
