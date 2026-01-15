class Website::Request < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :plan, presence: true
  validates :size, presence: true
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true, length: { minimum: 50, maximum: 500 }
  validates :verified, inclusion: { in: [ true, false ] }

  enum :plan, { static: 0, dynamic: 1, scalable: 2 }, validate: true
  enum :size, { small: 0, medium: 1, large: 2 }, validate: true
  enum :status, { pending: 0, rejected: 1, approved: 2 }, validate: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  generates_token_for :verification, expires_in: 1.week
end
