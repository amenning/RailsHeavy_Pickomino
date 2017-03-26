module Helpers
  module PlayerWormsHelper
    def self.player_worms_hash_after_claim(worm_value)
      @player_worm_set = PlayerWormSet.last
      TakeWorm.call(worm_value: worm_value, player_worm_set: @player_worm_set)
      create_player_worm_hash
    end

    private_class_method def self.create_player_worm_hash
      player_worm_hash = @player_worm_set.player_worm.all.to_a.reverse_each.map do |player_worm|
        worm_count = player_worm.worm.last.worm_count
        {
          value: player_worm.worm.last.value,
          image: Helpers::ImagesHelper.get_worm_tile_image(worm_count)
        }
      end
      player_worm_hash.compact
    end
  end
end
