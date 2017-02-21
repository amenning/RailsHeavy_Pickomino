class Theme < ActiveRecord::Base
  has_many :images, dependent: :restrict_with_error
end
