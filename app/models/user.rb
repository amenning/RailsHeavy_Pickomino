require 'pp'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable,
    :omniauthable,
    omniauth_providers: [:facebook, :google_oauth2, :github, :linkedin]
  validates :username, presence: true, uniqueness: true
  has_many :player, dependent: :restrict_with_error

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create! do |user|
      pp auth
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.firstname = auth.info.first_name || auth.info.name
      user.lastname = auth.info.last_name
      user.username = auth.info.first_name || auth.info.name
    end
  end
end
