class Website::Request < ApplicationRecord
  validates :title, presence: true
  validates :plan, presence: true
  validates :size, presence: true
  validates :email_address, presence: true
  validates :description, presence: true, length: { minimum: 50, maximum: 500 }

  enum :plan, { static: 0, dynamic: 1, scalable: 2 }, validate: true
  enum :size, { small: 0, medium: 1, large: 2 }, validate: true
  enum :status, { pending: 0, rejected: 1, approved: 2 }, validate: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  generates_token_for :verification, expires_in: 1.week
end
