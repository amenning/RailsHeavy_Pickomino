class Player < ActiveRecord::Base
  belongs_to :user
  has_many :game, dependent: :restrict_with_error
end
