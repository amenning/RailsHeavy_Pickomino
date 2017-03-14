module FrozenDicesHelper
  def self.get_frozen_dice_hash_after_freeze(dice_value)
    @frozen_dice_set = FrozenDiceSet.last
    FreezeDice.call(dice_value: dice_value, frozen_dice_set: @frozen_dice_set)
    create_frozen_dice_hash
  end

  private

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
