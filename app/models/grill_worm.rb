class GrillWorm < ActiveRecord::Base
  has_many :worm, dependent: :destroy
  belongs_to :grill
end
