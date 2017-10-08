class Phase < ActiveRecord::Base
  has_many :gamestate, dependent: :destroy
end
