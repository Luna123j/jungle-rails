class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { minimum: 3 }, on: :create

  def self.authenticate_with_credentials(email,password)
    user = User.find_by_email(email.downcase)
    user.authenticate(password)
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
