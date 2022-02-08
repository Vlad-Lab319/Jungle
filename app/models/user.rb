class User < ActiveRecord::Base
  has_secure_password

  validates :name,                  presence: true
  validates :last_name,             presence: true
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }
  validates :password,              length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user && user.authenticate(password)
  end

end
