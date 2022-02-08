class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    user && user.authenticate(password)
  end

end
