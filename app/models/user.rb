class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  before_save { email.downcase! }

  validates :username, length: { maximum: 20 },  presence: true, uniqueness: { case_sensitive: true }
  validates :name,     length: { maximum: 100 }, presence: true
  validates :email,    length: { maximum: 255 }, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
