module Helpers
  class Grills
    def grill_worms_hash(game, is_new_game = false)
      @game = game
      @grill = is_new_game ? new_grill : current_grill
      determine_which_grill_worms_can_be_taken unless is_new_game
      create_grill_worm_hash
    end

    def grill_worms_hash_with_all_inactive(game)
      @game = game
      @grill = current_grill
      make_all_worms_inactive
      create_grill_worm_hash
    end

    private

    def current_grill
      Grill.joins(:game).where(games: { id: @game }).last
    end

    def new_grill
      result = call_setup_grill_interactor
      result.grill
    end

    def call_setup_grill_interactor
      game_parameters = Rails.configuration.x.game_parameters
      SetupGrill.call(
        min_worm_tile: game_parameters['min_worm_tile'],
        max_worm_tile: game_parameters['max_worm_tile'],
        min_worm_count: game_parameters['min_worm_count'],
        worm_count_increment: game_parameters['worm_count_increment'],
        grill: Grill.create(game: @game)
      )
    end

    def determine_which_grill_worms_can_be_taken
      frozen_dice_status = FrozenDiceStatus.last
      frozen_dice_sum = frozen_dice_status.total
      has_worm = frozen_dice_status.has_worm == 1
      @grill.grill_worm.each do |grill_worm|
        if has_worm &&
           grill_worm.worm.last.value <= frozen_dice_sum &&
           grill_worm.is_dead.zero?
          grill_worm.update(can_take: true)
        else
          grill_worm.update(can_take: false)
        end
      end
    end

    def make_all_worms_inactive
      @grill.grill_worm.each do |grill_worm|
        grill_worm.update(can_take: false)
      end
    end

    def create_grill_worm_hash
      grill_worm_hash = Grill.select(:value, :worm_count, :can_take, :is_dead)
        .joins(grill_worm: :worm)
        .where('id' => @grill.id)
        .order('grill_worms.is_dead ASC, worms.value ASC').map do |worm|
          {
            value: worm.value,
            image: images_helper.get_worm_tile_image(worm.worm_count),
            canTake: worm.can_take == 1 ? true : false,
            isDead: worm.is_dead == 1 ? true : false
          }
        end
      grill_worm_hash.compact
    end

    def images_helper
      @images_helper ||= Helpers::Images.new
    end
  end
end
