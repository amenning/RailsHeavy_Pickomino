module GamesHelper
  def self.grill_worms_hash(is_new_game = false)
    GrillsHelper.grill_worms_hash(is_new_game)
  end

  def self.new_active_dice_hash(is_new_game = false)
    ActiveDicesHelper.new_active_dice_hash(is_new_game)
  end

  def self.active_dice_hash_after_freeze
    ActiveDicesHelper.active_dice_hash_after_freeze
  end

  def self.frozen_dice_hash_after_freeze(dice_value)
    FrozenDicesHelper.frozen_dice_hash_after_freeze(dice_value)
  end

  def self.frozen_dice_sum(frozen_dice_values)
    result = SumFrozenDice.call(frozen_dice_values: frozen_dice_values)
    result.frozen_dice_sum
  end

  def self.player_worms_hash_after_claim(worm_value)
    PlayerWormsHelper.player_worms_hash_after_claim(worm_value)
  end
end
