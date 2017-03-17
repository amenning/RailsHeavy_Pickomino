class GamesController < ApplicationController
  def play
    ActiveRecord::Base.transaction do
      @active_dice = GamesHelper.get_new_active_dice_hash(true)
      @frozen_dice = {}
      @frozen_dice_sum = 0
      @grill_worms = GamesHelper.get_grill_worms_hash(true)
      PlayerWormSet.create
      @player_worms = {}
    end
    respond_to do |format|
      format.html { render :game_board }
    end
  end

  def roll
    ActiveRecord::Base.transaction do
      @active_dice = GamesHelper.get_new_active_dice_hash
    end
    # Check if bunk
    # Disable roll button
    # @player_options = { roll: false, clearnBunk: true?, message: message }
    respond_to do |format|
      format.js { render 'roll' }
    end
  end

  def freeze_dice
    ActiveRecord::Base.transaction do
      @frozen_dice = GamesHelper.get_frozen_dice_hash_after_freeze(
        freeze_dice_params['value'].to_i
      )
      @active_dice = GamesHelper.get_active_dice_hash_after_freeze
      @frozen_dice_sum = GamesHelper.get_frozen_dice_sum
    end
    # Verify dice number grouping not already frozen
    # Move dice from active set to frozen set
    # Enable worm take action
    # Enable roll button
    # @active_dice
    # @frozen_dice
    # @player_options = { roll: true, message: message }
    respond_to do |format|
      format.js { render 'freeze_dice' }
    end
  end

  def take_worm
    ActiveRecord::Base.transaction do
      @player_worms = GamesHelper.get_player_worms_hash_after_claim(
        take_worm_params['value'].to_i
      )
      @grill_worms = GamesHelper.get_grill_worms_hash
    end
    # Verify frozen dice has worm
    # Verify forzen dice total is equal to or greater
    # Move worm from grill set to player worm set
    # Move frozen dice to active dice
    # Check for game end
    # Enable roll button
    # @grill_worms
    # @player_worms
    # @active_dice
    # @frozen_dice
    # @player_options = { roll: true, message: message }
    respond_to do |format|
      format.js { render 'take_worm' }
    end
  end

  def bunk
    # Check if player has any worm tiles
    # If player has worm, make largest grill worm tile dead
    # Move player worm to grill set
    # Enable roll button
    # @grill_worms
    # @player_worms
    # @active_dice
    # @frozen_dice
    # @player_options = { roll: true, message: message }
    respond_to do |format|
      format.js { render 'bunk' }
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def freeze_dice_params
    params.require(:dice).permit(:value)
  end

  def take_worm_params
    params.require(:worm).permit(:value)
  end
end
