module Helpers
  module Games
    def self.grill_worms_hash(is_new_game = false)
      Helpers::Grills.grill_worms_hash(is_new_game)
    end

    def self.new_active_dice_hash(is_new_game = false)
      Helpers::ActiveDices.new_active_dice_hash(is_new_game)
    end

    def self.active_dice_hash_after_freeze
      Helpers::ActiveDices.active_dice_hash_after_freeze
    end

    def self.frozen_dice_hash_after_freeze(dice_value)
      Helpers::FrozenDices.frozen_dice_hash_after_freeze(dice_value)
    end

    def self.frozen_dice_sum(frozen_dice_values)
      result = SumFrozenDice.call(frozen_dice_values: frozen_dice_values)
      result.frozen_dice_sum
    end

    def self.player_worms_hash_after_claim(worm_value)
      Helpers::PlayerWorms.player_worms_hash_after_claim(worm_value)
    end

    def self.sum_player_worms(player_worm_values)
      result = SumPlayerWorms.call(player_worm_values: player_worm_values)
      result.player_worms_total_count
    end
  end
end
