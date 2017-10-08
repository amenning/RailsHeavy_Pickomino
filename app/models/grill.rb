class Grill < ActiveRecord::Base
  belongs_to :game
  has_many :grill_worm, dependent: :destroy
end
