class GamesController < ApplicationController
  before_action { @games_helper = Helpers::Games.new }

  def play
    ActiveRecord::Base.transaction do
      @active_dice = @games_helper.new_active_dice_hash(true)
      @frozen_dice = {}
      FrozenDiceStatus.create(total: 0, has_worm: false)
      @frozen_dice_sum = 0
      @grill_worms = @games_helper.grill_worms_hash(true)
      @player_options = @games_helper.player_options_hash(true)
      PlayerWormSet.create
      @player_worms = {}
      @player_worms_total_count = 0
    end
    respond_to do |format|
      format.html { render :game_board }
    end
  end

  def roll
    if PlayerOption.last.can_roll.zero?
      render nothing: true, status: 204
      return
    end
    ActiveRecord::Base.transaction do
      @grill_worms = @games_helper.grill_worms_hash_with_all_inactive
      @active_dice = @games_helper.new_active_dice_hash
      @games_helper.update_roll_option_state(false)
      @games_helper.check_for_bunk_after_roll(@active_dice)
      @player_options = @games_helper.player_options_hash
    end
    respond_to do |format|
      format.js { render 'roll' }
    end
  end

  def freeze_dice
    ActiveRecord::Base.transaction do
      @frozen_dice = @games_helper.frozen_dice_hash_after_freeze(
        freeze_dice_params['value'].to_i
      )
      @active_dice = @games_helper.active_dice_hash_after_freeze
      @player_options = @games_helper.update_roll_option_state(true) unless @active_dice.empty?
      @frozen_dice_sum = @games_helper.frozen_dice_sum(
        FrozenDiceSet.last.all_frozen_dice_values_with_worms_converted
      )
      @grill_worms = @games_helper.grill_worms_hash
      @games_helper.check_for_bunk_after_dice_freeze(
        @grill_worms,
        @active_dice,
        FrozenDiceSet.last.all_raw_frozen_dice_values,
        @frozen_dice_sum
      )
      @player_options = @games_helper.player_options_hash
    end
    respond_to do |format|
      format.js { render 'freeze_dice' }
    end
  end

  def take_worm
    worm_value = take_worm_params['value'].to_i
    status = FrozenDiceStatus.last
    if !status.has_worm || status.total < worm_value
      render nothing: true, status: 204
      return
    end

    ActiveRecord::Base.transaction do
      @player_worms = @games_helper.player_worms_hash_after_claim(worm_value)
      @player_worms_total_count = @games_helper.sum_player_worms(
        PlayerWormSet.last.all_player_worm_values
      )
      @active_dice = @games_helper.new_active_dice_hash(true)
      @frozen_dice = {}
      @grill_worms = @games_helper.grill_worms_hash_with_all_inactive
      @games_helper.check_for_game_end
      @player_options = @games_helper.update_roll_option_state(true)
      @player_options = @games_helper.player_options_hash
      FrozenDiceStatus.create(total: 0, has_worm: false)
      @frozen_dice_sum = 0
    end
    respond_to do |format|
      format.js { render 'take_worm' }
    end
  end

  def clear_bunk
    if PlayerOption.last.bunk.zero?
      render nothing: true, status: 204
      return
    end
    ActiveRecord::Base.transaction do
      ClearBunk.call(player_worm_set: PlayerWormSet.last)
      @player_worms = @games_helper.player_worms_hash_after_bunk_clear
      @player_worms_total_count = @games_helper.sum_player_worms(
        PlayerWormSet.last.all_player_worm_values
      )
      @active_dice = @games_helper.new_active_dice_hash(true)
      @frozen_dice = {}
      @games_helper.clear_bunk_option
      @games_helper.update_roll_option_state(true)
      @player_options = @games_helper.player_options_hash
      FrozenDiceStatus.create(total: 0, has_worm: false)
      @frozen_dice_sum = 0
      @grill_worms = @games_helper.grill_worms_hash_with_all_inactive
    end
    respond_to do |format|
      format.js { render 'clear_bunk' }
    end
  end

  def game_over
    # @grill_worms
    # @player_worms
    # @active_dice
    # @frozen_dice
    # @player_options = { reset: true, message: message }
    respond_to do |format|
      format.js { render 'game_over' }
    end
  end

  private

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def freeze_dice_params
    params.require(:dice).permit(:value)
  end

  def take_worm_params
    params.require(:worm).permit(:value)
  end
end
