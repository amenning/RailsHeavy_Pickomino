class Dice < ActiveRecord::Base
  has_many :active_dice_sets, dependent: :restrict_with_error
  has_many :frozen_dice_sets, dependent: :restrict_with_error
end
