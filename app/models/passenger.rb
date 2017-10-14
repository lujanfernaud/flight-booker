class Passenger < ApplicationRecord
  has_many :passenger_bookings
  has_many :bookings, through: :passenger_bookings

  has_many :flights, through: :bookings

  validates :first_name, :last_name, presence: true, length: { in: 2..64 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  def full_name
    first_name + " " + last_name
  end

  def email_hidden
    email_parts = email.match(/(^\w\w+\.?\w+)(\@\w+\.\w{3})/)
    user, domain = email_parts[1], email_parts[2]
    user.gsub(/\w/, "*") + domain.gsub(/\w/, "*")
  end
end
