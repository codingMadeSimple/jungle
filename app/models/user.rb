class User < ApplicationRecord
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 7 }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
