class Registration < ActiveRecord::Base
  before_save { |registration| registration.email = registration.email.downcase }
  before_save { |registration| registration.name = registration.name.strip }
  belongs_to :piece

  validates :name, length: { within: 1..25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, numericality: { only_integer: true }, length: { is: 10, message: 'should be 10 digits starting with area code'}
  validates :message, presence: false
  validates :neighborhood, presence: true
  validates :zip_code, length: { is: 5, message: 'should be 5 digits' }
  validates :interested_in_rental, :interested_in_purchase, inclusion: { in: [true, false] }
end
