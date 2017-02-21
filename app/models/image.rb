class Image < ActiveRecord::Base
  belongs_to :theme  
  validates :theme, :presence => true
end
