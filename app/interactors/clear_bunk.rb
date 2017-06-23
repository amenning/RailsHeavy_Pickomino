class ClearBunk
  include Interactor

  def call
    @bunk_player_worm = context.player_worm_set.player_worm.last
    @grill = Grill.last
    p @bunk_player_worm
    return nil if @bunk_player_worm.nil?
    move_worm_from_player_to_grill
    kill_highest_value_worm_on_grill unless @grill.grill_worm.last.nil?
  end

  private

  def kill_highest_value_worm_on_grill
    grill_worm_to_kill = Grill.select(:grill_worm_id, :is_dead)
      .joins(grill_worm: :worm)
      .where('id' => @grill.id, 'grill_worms.is_dead' => 0)
      .order('worms.value DESC')
      .first
    dead_worm = GrillWorm.find(grill_worm_to_kill.grill_worm_id)
    dead_worm.update(is_dead: 1)
  end

  def move_worm_from_player_to_grill
    bunk_worm = @bunk_player_worm.worm.last
    grill_worm = @grill.grill_worm.create
    bunk_worm.update(player_worm_id: nil, grill_worm_id: grill_worm.id)
    @bunk_player_worm.destroy
  end
end
