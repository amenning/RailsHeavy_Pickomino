class Player < ActiveRecord::Base
  belongs_to :user
  has_many :game, dependent: :restrict_with_error
  has_many :player_worms, dependent: :restrict_with_error
  has_many :player_statuses, dependent: :restrict_with_error
end
