class SetupGrill
  include Interactor

  def call
    @min_worm_tile = context.min_worm_tile
    @max_worm_tile = context.max_worm_tile
    @min_worm_count = context.min_worm_count
    @worm_count_increment = context.worm_count_increment
    @grill = context.grill
    associate_worms_with_grill
  end

  private

  def associate_worms_with_grill
    (@min_worm_tile..@max_worm_tile).each do |value|
      grill_worm = @grill.grill_worm.create(can_take: 0, is_dead: 0)
      grill_worm.worm.create(value: value, worm_count: worm_count(value))
    end
  end

  def worm_count(value)
    ((value - @min_worm_tile) / @worm_count_increment) + @min_worm_count
  end
end
