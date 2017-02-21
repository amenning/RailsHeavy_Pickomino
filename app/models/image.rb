class Image < ActiveRecord::Base
  belongs_to :theme  
  validates :theme, :presence => true
  has_many :worm_tiles, dependent: :restrict_with_error
end
