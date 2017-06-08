module Helpers
  class PlayerOptions
    def player_options_hash(is_new_game = false)
      @player_options = is_new_game ? new_option : PlayerOption.last
      create_player_options_hash
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
