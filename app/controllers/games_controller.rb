class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_games_helper_service
  before_action :set_game, except: [:play]

  def play
    authorize Game.new
    ActiveRecord::Base.transaction do
      delete_previous_games
      @player = Player.create(user: current_user)
      @game = Game.create(player: @player)
      @active_dice = @games_helper.new_active_dice_hash(@game, true)
      @frozen_dice = {}
      FrozenDiceStatus.create(game: @game, total: 0, has_worm: false)
      @frozen_dice_sum = 0
      @grill_worms = @games_helper.grill_worms_hash(@game, true)
      @player_options = @games_helper.player_options_hash(@game, true)
      PlayerWormSet.create(game: @game)
      @player_worms = {}
      @player_worms_total_count = 0
    end
    respond_to do |format|
      format.html { render :game_board }
    end
  end

  def roll
    if current_player_option.can_roll.zero?
      render nothing: true, status: 204
      return
    end
    ActiveRecord::Base.transaction do
      @grill_worms = @games_helper.grill_worms_hash_with_all_inactive(@game)
      @active_dice = @games_helper.new_active_dice_hash(@game)
      @games_helper.update_roll_option_state(@game, false)
      @games_helper.check_for_bunk_after_roll(@game, @active_dice)
      @player_options = @games_helper.player_options_hash(@game)
    end
    respond_to do |format|
      format.js { render 'roll' }
    end
  end

  def freeze_dice
    ActiveRecord::Base.transaction do
      @frozen_dice = @games_helper.frozen_dice_hash_after_freeze(
        @game,
        freeze_dice_params['value'].to_i
      )
      @active_dice = @games_helper.active_dice_hash_after_freeze(@game)
      @player_options = @games_helper.update_roll_option_state(@game, true) unless @active_dice.empty?
      @frozen_dice_sum = @games_helper.frozen_dice_sum(
        @game,
        current_frozen_dice_set.all_frozen_dice_values_with_worms_converted
      )
      @grill_worms = @games_helper.grill_worms_hash(@game)
      @games_helper.check_for_bunk_after_dice_freeze(
        @game,
        @grill_worms,
        @active_dice,
        current_frozen_dice_set.all_raw_frozen_dice_values,
        @frozen_dice_sum
      )
      @player_options = @games_helper.player_options_hash(@game)
    end
    respond_to do |format|
      format.js { render 'freeze_dice' }
    end
  end

  def take_worm
    worm_value = take_worm_params['value'].to_i
    status = current_frozen_dice_status
    if !status.has_worm || status.total < worm_value
      render nothing: true, status: 204
      return
    end
    ActiveRecord::Base.transaction do
      @player_worms = @games_helper.player_worms_hash_after_claim(@game, worm_value)
      @player_worms_total_count = @games_helper.sum_player_worms(
        current_player_worm_set.all_player_worm_values
      )
      @active_dice = @games_helper.new_active_dice_hash(@game, true)
      @frozen_dice = {}
      @grill_worms = @games_helper.grill_worms_hash_with_all_inactive(@game)
      @games_helper.check_for_game_end(@game)
      @player_options = @games_helper.update_roll_option_state(@game, true)
      @player_options = @games_helper.player_options_hash(@game)
      FrozenDiceStatus.create(game: @game, total: 0, has_worm: false)
      @frozen_dice_sum = 0
    end
    respond_to do |format|
      format.js { render 'take_worm' }
    end
  end

  def clear_bunk
    if current_player_option.bunk.zero?
      render nothing: true, status: 204
      return
    end
    ActiveRecord::Base.transaction do
      ClearBunk.call(player_worm_set: current_player_worm_set)
      @player_worms = @games_helper.player_worms_hash_after_bunk_clear
      @player_worms_total_count = @games_helper.sum_player_worms(
        current_player_worm_set.all_player_worm_values
      )
      @active_dice = @games_helper.new_active_dice_hash(@game, true)
      @frozen_dice = {}
      @games_helper.clear_bunk_option(@game)
      @games_helper.update_roll_option_state(@game, true)
      @player_options = @games_helper.player_options_hash(@game)
      FrozenDiceStatus.create(game: @game, total: 0, has_worm: false)
      @frozen_dice_sum = 0
      @grill_worms = @games_helper.grill_worms_hash_with_all_inactive(@game)
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

  def load_games_helper_service(service = Helpers::Games.new)
    @games_helper ||= service
  end

  private

  def current_frozen_dice_set
    FrozenDiceSet.joins(:game).where(games: { id: @game }).last
  end

  def current_frozen_dice_status
    FrozenDiceStatus.joins(:game).where(games: { id: @game }).last
  end

  def current_player_worm_set
    PlayerWormSet.joins(:game).where(games: { id: @game }).last
  end

  def current_player_option
    PlayerOption.joins(:game).where(games: { id: @game }).last
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def freeze_dice_params
    params.require(:dice).permit(:value)
  end

  def take_worm_params
    params.require(:worm).permit(:value)
  end

  def set_game
    @game = Game.joins(player: :user).where(users: {id: current_user}).last
  end

  def delete_previous_games
    Game.joins(player: :user)
      .where(users: {id: current_user})
      .all
      .to_a
      .map { |game| game.destroy }
  end
end
