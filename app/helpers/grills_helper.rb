module GrillsHelper
  def self.get_grill_worms_hash(is_new_game = false)
    @is_new_game = is_new_game
    @grill = get_new_grill
    create_grill_worm_hash
  end

  private

  def self.get_new_grill
    result = call_setup_grill_interactor if @is_new_game
    result.grill
  end

  def self.call_setup_grill_interactor
    SetupGrill.call(
      min_worm_tile: Rails.configuration.x.game_parameters['min_worm_tile'],
      max_worm_tile: Rails.configuration.x.game_parameters['max_worm_tile'],
      min_worm_count: Rails.configuration.x.game_parameters['min_worm_count'],
      worm_count_increment: Rails.configuration.x.game_parameters['worm_count_increment'],
      grill: Grill.create
    )
  end

  def self.create_grill_worm_hash
    grill_worm_hash = @grill.grill_worm.all.to_a.map do |grill_worm|
      worm_count = grill_worm.worm.last.worm_count
      {
        value: grill_worm.worm.last.value,
        image: ImagesHelper.get_worm_tile_image(worm_count),
        canTake: grill_worm['can_take'] == 1 ? true : false,
        isDead: grill_worm['is_dead'] == 1 ? true : false
      }
    end
    grill_worm_hash.compact
  end
end
