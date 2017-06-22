class ClearBunk
  include Interactor

  def call
    @player_worm_set = context.player_worm_set
    @grill = Grill.last
    move_worm_from_player_to_grill
  end

  private

  def move_worm_from_player_to_grill
    bunk_player_worm = @player_worm_set.player_worm.last
    return nil if bunk_player_worm == []
    bunk_worm = bunk_player_worm.worm.last
    grill_worm = @grill.grill_worm.create
    bunk_worm.update(player_worm_id: nil, grill_worm_id: grill_worm.id)
    bunk_player_worm.destroy
  end
end
