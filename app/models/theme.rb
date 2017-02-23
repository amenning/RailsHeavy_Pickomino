class Theme < ActiveRecord::Base
  has_many :image, dependent: :restrict_with_error
end
