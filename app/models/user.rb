class User < ActiveRecord::Base
  has_many :player, dependent: :restrict_with_error
end
