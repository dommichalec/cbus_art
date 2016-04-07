# piece class
class Piece < ActiveRecord::Base
  # piece validations
  before_save { |piece| piece.medium = piece.medium.downcase }

  validates :title, :medium, :size, presence: true, length: { within: 1..40 }
  validates :description, length: { within: 1..500 }
  validates :rental_price_per_day, :rental_price_per_week, :rental_price_per_month, :sale_price, numericality: { greater_than_or_equal_to: 0 }

  # piece class methods

  # Piece#order_by takes a parameter and orders pieces based on that parameter
  # defaults to ordering by last_updated if unknown parameter is passed in.
  def self.order_by(command)
    case command
    when 'last_updated' then order('updated_at desc')
    when 'last_added' then order('created_at desc')
    else order('updated_at desc')
    end
  end
end
