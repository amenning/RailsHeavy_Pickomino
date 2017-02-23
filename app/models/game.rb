class Game < ActiveRecord::Base
  belongs_to :player
  has_many :gamestate, dependent: :restrict_with_error
  has_many :grill, dependent: :restrict_with_error
  has_many :player_option, dependent: :restrict_with_error
  has_many :active_dice_set, dependent: :restrict_with_error
  has_many :frozen_dice_set, dependent: :restrict_with_error
  has_many :frozen_dice_status, dependent: :restrict_with_error
  has_many :player_worm_set, dependent: :restrict_with_error
  has_many :player_status, dependent: :restrict_with_error
end
