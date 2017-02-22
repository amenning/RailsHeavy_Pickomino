class Worm < ActiveRecord::Base
  has_many :grill_worms, dependent: :restrict_with_error
end
