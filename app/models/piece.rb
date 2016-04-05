# piece class
class Piece < ActiveRecord::Base
  # piece validations
  validates :title, :medium, :size, presence: true, length: { within: 1..40 }
  validates :description, length: { within: 1..500 }
  validates :rental_price_per_day, :rental_price_per_week, :rental_price_per_month, :sale_price, numericality: { greater_than_or_equal_to: 0 }

  # piece class methods
  def self.order_by_last_updated
    order('updated_at desc')
  end
end
