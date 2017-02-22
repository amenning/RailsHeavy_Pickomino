class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  has_many :player, dependent: :restrict_with_error
  
  has_secure_password
  
  #def password=(password)
  #  self.password = BCrypt::Password.create(password)
  #end
  
  #def is_password?(password)
  #  BCrypt::Password.new(self.password) == password
  #end
end
