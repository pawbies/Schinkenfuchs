class Website::Request < ApplicationRecord
  validates :title, presence: true
  validates :plan, presence: true
  validates :size, presence: true
  validates :email_address, presence: true
  validates :accepted, inclusion: { in: [ true, false ] }

  enum :plan, { static: 0, dynamic: 1, scalable: 2 }, validate: true
  enum :size, { small: 0, medium: 1, large: 2 }, validate: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  generates_token_for :verification, expires_in: 1.week
end
