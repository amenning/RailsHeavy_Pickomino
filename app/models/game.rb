class Game < ActiveRecord::Base
  belongs_to :player
  has_many :gamestate, dependent: :destroy
  has_many :grill, dependent: :destroy
  has_many :player_option, dependent: :destroy
  has_many :active_dice_set, dependent: :destroy
  has_many :frozen_dice_set, dependent: :destroy
  has_many :frozen_dice_status, dependent: :destroy
  has_many :player_worm_set, dependent: :destroy
  has_many :player_status, dependent: :destroy
end
