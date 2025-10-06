class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :sites, dependent: :nullify

  validates :email_address, presence: true, uniqueness: true
  validates :username, presence: true

  enum :role, { user: 0, admin: 1 }, validate: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  normalizes :username, with: ->(u) { u.strip }
end
