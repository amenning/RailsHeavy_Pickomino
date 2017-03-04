class Dice < ActiveRecord::Base
  belongs_to :active_dice
  belongs_to :frozen_dice

  def create_random_dice
    self.value = rand(1..6)
    save
  end
end
