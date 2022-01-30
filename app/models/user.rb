class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :words
  has_many :questions

  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end
