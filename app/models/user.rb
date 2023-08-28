class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, presence: true
  validates :password, length: { minimum: 3 }

  # New class method
  def self.authenticate_with_credentials(email, password)
    # Remove any leading/trailing whitespace from email
    email.strip!

    # Make email case insensitive for authentication
    user = User.find_by_email(email.downcase)

    # If user exists and the password is authenticated, return the user, otherwise return nil
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
