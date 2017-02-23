class User < ActiveRecord::Base
  # validates :username, presence: true, uniqueness: true
  has_many :player, dependent: :restrict_with_error

  has_secure_password
end
