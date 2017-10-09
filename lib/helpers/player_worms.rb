module Helpers
  class PlayerWorms
    def player_worms_hash_after_claim(game, worm_value)
      @player_worm_set = PlayerWormSet.last
      TakeWorm.call(game: game, worm_value: worm_value, player_worm_set: @player_worm_set)
      create_player_worm_hash
    end

    def sum_player_worms(player_worm_values)
      result = SumPlayerWorms.call(player_worm_values: player_worm_values)
      result.player_worms_total_count
    end

    def player_worms_hash_after_bunk_clear
      @player_worm_set = PlayerWormSet.last
      create_player_worm_hash
    end

    private

    def create_player_worm_hash
      player_worm_hash = @player_worm_set.player_worm.all.to_a.reverse_each.map do |player_worm|
        worm_count = player_worm.worm.last.worm_count
        {
          value: player_worm.worm.last.value,
          image: images_helper.get_worm_tile_image(worm_count)
        }
      end
      player_worm_hash.compact
    end

    def images_helper
      @images_helper ||= Helpers::Images.new
    end
  end
end
