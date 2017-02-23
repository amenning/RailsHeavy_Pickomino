class Player < ActiveRecord::Base
  belongs_to :user
  has_many :game, dependent: :restrict_with_error
  has_many :player_worm_set, dependent: :restrict_with_error
  has_many :player_status, dependent: :restrict_with_error
  has_many :gamestate, dependent: :restrict_with_error
end
