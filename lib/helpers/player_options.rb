module Helpers
  class PlayerOptions
    def player_options_hash(is_new_game = false)
      @player_options = is_new_game ? new_option : PlayerOption.last
      create_player_options_hash
    end

    def update_roll_option_state(state)
      player_option = PlayerOption.last
      player_option.can_roll = state
      player_option.save
    end

    def check_for_bunk_after_roll(active_dice)
      player_option = PlayerOption.last
      player_option.update(bunk: !are_any_active_dice_freezable(active_dice))
    end

    def check_for_bunk_after_dice_freeze(
      grill_worms,
      active_dice,
      frozen_dice,
      frozen_dice_sum
    )
      return unless active_dice.empty?
      return unless (frozen_dice.exclude? 6) || (grill_worms[0][:value] > frozen_dice_sum)
      player_option = PlayerOption.last
      player_option.update(bunk: true)
    end

    def clear_bunk_option
      player_option = PlayerOption.last
      player_option.update(bunk: false)
    end

    private

    def new_option
      PlayerOption.create(can_roll: true)
    end

    def are_any_active_dice_freezable(active_dice_hash)
      active_dice_hash.reduce(false) do |can_freeze_one, dice|
        can_freeze_one || (dice[:canFreeze] == 1)
      end
    end

    def create_player_options_hash
      {
        bunk: @player_options.bunk == 1,
        canRoll: @player_options.can_roll == 1
      }
    end
  end
end
