class User < ApplicationRecord
  validates :username, length: { maximum: 12 }, presence: true
  validates :name,     length: { maximum: 100 }, presence: true
  validates :email,    presence: true
end
