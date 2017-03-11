class GrillWorm < ActiveRecord::Base
  has_many :worm, dependent: :restrict_with_error
  belongs_to :grill
end
