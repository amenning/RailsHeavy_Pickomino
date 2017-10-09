class TakeWorm
  include Interactor

  def call
    @game = context.game
    @worm_value = context.worm_value
    @player_worm_set = context.player_worm_set
    @grill = Grill.joins(:game).where(games: { id: @game }).last
    move_worm_from_grill_to_player
  end

  private

  def move_worm_from_grill_to_player
    @grill.grill_worm.all.each do |grill_worm|
      worm = grill_worm.worm.last
      next unless worm.value == @worm_value
      create_new_player_worm_and_associate_with_worm(worm)
      unassociated_grill_worm_and_destroy(grill_worm, worm)
    end
  end

  def create_new_player_worm_and_associate_with_worm(worm)
    player_worm = @player_worm_set.player_worm.create
    worm.player_worm_id = player_worm.id
    worm.save
  end

  def unassociated_grill_worm_and_destroy(grill_worm, worm)
    worm.grill_worm_id = nil
    worm.save
    grill_worm.destroy
  end
end
