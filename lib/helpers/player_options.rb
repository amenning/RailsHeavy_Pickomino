module Helpers
  class PlayerOptions
    def player_options_hash(game, is_new_game = false)
      @game = game
      @player_options = is_new_game ? new_option : current_player_option
      create_player_options_hash
    end

    def update_roll_option_state(game, state)
      @game = game
      player_option = current_player_option
      player_option.can_roll = state
      player_option.save
    end

    def check_for_bunk_after_roll(game, active_dice)
      @game = game
      player_option = current_player_option
      player_option.update(bunk: !are_any_active_dice_freezable(active_dice))
    end

    def check_for_bunk_after_dice_freeze(
      game,
      grill_worms,
      active_dice,
      frozen_dice,
      frozen_dice_sum
    )
      @game = game
      return unless active_dice.empty?
      return unless (frozen_dice.exclude? 6) || (grill_worms[0][:value] > frozen_dice_sum)
      player_option = current_player_option
      player_option.update(bunk: true)
    end

    def clear_bunk_option(game)
      @game = game
      player_option = current_player_option
      player_option.update(bunk: false)
    end

    def check_for_game_end(game)
      @game = game
      return unless no_live_grill_worms_left
      player_option = current_player_option
      player_option.update(is_game_over: true)
    end

    private

    def current_player_option
      PlayerOption.joins(:game).where(games: { id: @game }).last
    end


    def new_option
      PlayerOption.create(game: @game, can_roll: true, bunk: false, is_game_over: false)
    end

    def are_any_active_dice_freezable(active_dice_hash)
      active_dice_hash.reduce(false) do |can_freeze_one, dice|
        can_freeze_one || (dice[:canFreeze] == 1)
      end
    end

    def create_player_options_hash
      {
        bunk: @player_options.bunk == 1,
        canRoll: @player_options.can_roll == 1,
        isGameOver: @player_options.is_game_over == 1
      }
    end

    def no_live_grill_worms_left
      Grill.select(:id, :is_dead)
        .joins(:grill_worm)
        .where('id' => Grill.last.id, 'grill_worms.is_dead' => 0)
        .map(&:is_dead)
        .empty?
    end
  end
end
