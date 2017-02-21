class Theme < ActiveRecord::Base
  has_many :images, dependent: :restrict_with_error
  has_many :worm_tiles, dependent: :restrict_with_error
end
