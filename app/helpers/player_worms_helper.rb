module PlayerWormsHelper
  def self.get_player_worms_hash_after_claim(worm_value)
    @worm_value = worm_value
    @grill = Grill.last
    @player_worm_set = PlayerWormSet.last
    move_worm_from_grill_to_player
    create_player_worm_hash
  end

  private

  def self.move_worm_from_grill_to_player
    @grill.grill_worm.all.each do |grill_worm|
      worm = grill_worm.worm.last
      next unless worm.value == @worm_value
      create_new_player_worm_and_associate_with_worm(worm)
      unassociated_grill_worm_and_destroy(grill_worm, worm)
    end
  end

  def self.create_new_player_worm_and_associate_with_worm(worm)
    player_worm = @player_worm_set.player_worm.create
    worm.player_worm_id = player_worm.id
    worm.save
  end

  def self.unassociated_grill_worm_and_destroy(grill_worm, worm)
    worm.grill_worm_id = nil
    worm.save
    grill_worm.destroy
  end

  def self.create_player_worm_hash
    player_worm_hash = @player_worm_set.player_worm.all.to_a.reverse_each.map do |player_worm|
      worm_count = player_worm.worm.last.worm_count
      {
        value: player_worm.worm.last.value,
        image: ImagesHelper.get_worm_tile_image(worm_count)
      }
    end
    player_worm_hash.compact
  end
end
