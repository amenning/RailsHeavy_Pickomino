class Game < ActiveRecord::Base
  belongs_to :player
  has_many :game_state, dependent: :restrict_with_error
end
