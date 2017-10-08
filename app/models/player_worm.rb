class PlayerWorm < ActiveRecord::Base
  belongs_to :player_worm_set
  has_many :worm, dependent: :destroy

  def worm_count
    worm.last.worm_count.to_i
  end
end
