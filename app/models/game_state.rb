class GameState < ActiveRecord::Base
  belongs_to :game
  has_many :grill, dependent: :restrict_with_error
  has_many :player_options, dependent: :restrict_with_error
  has_many :active_dice_sets, dependent: :restrict_with_error
  has_many :frozen_dice_sets, dependent: :restrict_with_error
  has_many :frozen_dice_statuses, dependent: :restrict_with_error
  has_many :player_worms, dependent: :restrict_with_error
  has_many :player_statuses, dependent: :restrict_with_error
end
