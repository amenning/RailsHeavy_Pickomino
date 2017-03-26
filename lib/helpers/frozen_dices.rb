module Helpers
  class FrozenDices
    def frozen_dice_hash_after_freeze(dice_value)
      @frozen_dice_set = FrozenDiceSet.last
      FreezeDice.call(dice_value: dice_value, frozen_dice_set: @frozen_dice_set)
      create_frozen_dice_hash
    end

    private

    def create_frozen_dice_hash
      return {} if @frozen_dice_set.frozen_dice.nil?
      frozen_dice_hash = FrozenDiceSet.select(:value)
        .joins(frozen_dice: :dice)
        .where('id' => @frozen_dice_set.id).map do |dice|
          {
            value: dice.value,
            image: images_helper.get_dice_image(dice.value)
          }
        end
      frozen_dice_hash.compact
    end

    def images_helper
      @images_helper ||= Helpers::Images.new
    end
  end
end
