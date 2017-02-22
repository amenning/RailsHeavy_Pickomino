class GameState < ActiveRecord::Base
  belongs_to :game
  has_many :grill, dependent: :restrict_with_error
end
