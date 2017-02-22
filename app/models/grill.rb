class Grill < ActiveRecord::Base
  belongs_to :game_state
  has_many :grill_worm, dependent: :restrict_with_error
end
