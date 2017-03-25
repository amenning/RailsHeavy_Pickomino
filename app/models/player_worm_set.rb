class PlayerWormSet < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many :player_worm, dependent: :restrict_with_error

  def all_player_worm_values
    player_worm.all.to_a.map(&:worm_count)
  end
end
