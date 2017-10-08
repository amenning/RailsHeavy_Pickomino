class Player < ActiveRecord::Base
  belongs_to :user
  has_many :game, dependent: :destroy
  has_many :player_worm_set, dependent: :destroy
  has_many :player_status, dependent: :destroy
  has_many :gamestate, dependent: :destroy
end
