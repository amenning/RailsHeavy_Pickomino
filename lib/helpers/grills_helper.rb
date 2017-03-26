module Helpers
  module GrillsHelper
    def self.grill_worms_hash(is_new_game = false)
      @grill = is_new_game ? new_grill : Grill.last
      create_grill_worm_hash
    end

    private_class_method def self.new_grill
      result = call_setup_grill_interactor
      result.grill
    end

    private_class_method def self.call_setup_grill_interactor
      game_parameters = Rails.configuration.x.game_parameters
      SetupGrill.call(
        min_worm_tile: game_parameters['min_worm_tile'],
        max_worm_tile: game_parameters['max_worm_tile'],
        min_worm_count: game_parameters['min_worm_count'],
        worm_count_increment: game_parameters['worm_count_increment'],
        grill: Grill.create
      )
    end

    private_class_method def self.create_grill_worm_hash
      grill_worm_hash = Grill.select(:value, :worm_count, :can_take, :is_dead)
        .joins(grill_worm: :worm)
        .where('id' => @grill.id).map do |worm|
          {
            value: worm.value,
            image: Helpers::ImagesHelper.get_worm_tile_image(worm.worm_count),
            canTake: worm.can_take == 1 ? true : false,
            isDead: worm.is_dead == 1 ? true : false
          }
        end
      grill_worm_hash.compact
    end
  end
end
