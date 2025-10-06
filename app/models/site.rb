class Site < ApplicationRecord
  belongs_to :customer, class_name: "User", optional: true

  validates :title, presence: true
  validates :plan, presence: true
  validates :size, presence: true
  validates :accepted, inclusion: { in: [ true, false ] }

  enum :plan, { static: 0, dynamic: 1, scalable: 2 }, validate: true
  enum :size, { small: 0, medium: 1, large: 2 }, validate: true
end
