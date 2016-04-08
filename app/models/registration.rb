class Registration < ActiveRecord::Base
  before_save { |registration| registration.email = registration.email.downcase }
  belongs_to :piece

  validates :name, presence: true, length: { within: 1..25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :message, presence: false
  validates :zip_code, presence: true, numericality: { only_integer: true }
  validates :interested_in_rental, :interested_in_purchase, inclusion: { in: [true, false] }
end
