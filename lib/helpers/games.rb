module Helpers
  class Games < Helpers::BaseHelper
    def grill_worms_hash(is_new_game = false)
      @grills_helper.grill_worms_hash(is_new_game)
    end

    def player_options_hash(is_new_game = false)
      @player_options_helper.player_options_hash(is_new_game)
    end

    def new_active_dice_hash(is_new_game = false)
      @active_dices_helper.new_active_dice_hash(is_new_game)
    end

    def active_dice_hash_after_freeze
      @active_dices_helper.active_dice_hash_after_freeze
    end

    def frozen_dice_hash_after_freeze(dice_value)
      @frozen_dices_helper.frozen_dice_hash_after_freeze(dice_value)
    end

    def frozen_dice_sum(frozen_dice_values)
      @frozen_dices_helper.frozen_dice_sum(frozen_dice_values)
    end

    def player_worms_hash_after_claim(worm_value)
      @player_worms_helper.player_worms_hash_after_claim(worm_value)
    end

    def sum_player_worms(player_worm_values)
      @player_worms_helper.sum_player_worms(player_worm_values)
    end
  end
end
