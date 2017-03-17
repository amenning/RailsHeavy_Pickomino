module GamesHelper
  def self.get_grill_worms_hash(is_new_game = false)
    GrillsHelper.get_grill_worms_hash(is_new_game)
  end

  def self.get_new_active_dice_hash(is_new_game = false)
    ActiveDicesHelper.new_active_dice_hash(is_new_game)
  end

  def self.get_active_dice_hash_after_freeze
    ActiveDicesHelper.active_dice_hash_after_freeze
  end

  def self.get_frozen_dice_hash_after_freeze(dice_value)
    FrozenDicesHelper.frozen_dice_hash_after_freeze(dice_value)
  end

  def self.get_frozen_dice_sum
    result = SumFrozenDice.call
    result.frozen_dice_sum
  end

  def self.get_player_worms_hash_after_claim(worm_value)
    PlayerWormsHelper.get_player_worms_hash_after_claim(worm_value)
  end
end
