class Passenger < ApplicationRecord
  has_many :passenger_bookings
  has_many :bookings, through: :passenger_bookings

  has_many :flights, through: :bookings

  validates :name, presence: true, length: { in: 3..64 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
end
