class SumPlayerWorms
  include Interactor

  def call
    @player_worm_values = context.player_worm_values
    context.player_worm_count = player_worm_count
  end

  private

  def player_worm_count
    @player_worm_values.reduce(0) do |sum, worm_count|
      sum + worm_count
    end
  end
end
