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

    private

    def new_option
      PlayerOption.create(can_roll: true)
    end

    def create_player_options_hash
      { canRoll: @player_options.can_roll == 1 }
    end
  end
end
