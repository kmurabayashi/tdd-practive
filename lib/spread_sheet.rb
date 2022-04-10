require 'product'
require "pry"

class SpreadSheet < Product
  attr_reader :name, :price, :category_name, :revenue_recognition_rate_numerator,
              :revenue_recognition_rate_denominator, :revenue_recognition_timing

  def initialize(name, price)
    super
    @category_name = 'スプレッドシート'
    @revenue_recognition_rate_numerator = 2
    @revenue_recognition_rate_denominator = 3
    @revenue_recognition_timing = 30
  end

  def before_revenue_recognition_price
    (price / @revenue_recognition_rate_denominator * @revenue_recognition_rate_numerator) + price % @revenue_recognition_rate_denominator
  end
end