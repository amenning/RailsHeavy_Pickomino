class Phase < ActiveRecord::Base
  has_many :gamestate, dependent: :restrict_with_error
end
