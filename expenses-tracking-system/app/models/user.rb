class User < ApplicationRecord
  has_secure_password
  has_many :ledgers, dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

end