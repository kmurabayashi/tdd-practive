require 'product'
class WordProcessor < Product
  attr_reader :name, :price, :category_name, :revenue_recognition_rate_numerator,
              :revenue_recognition_rate_denominator, :revenue_recognition_timing
  def initialize(name, price)
    super
    @category_name = 'ワードプロセッサ'
    @revenue_recognition_rate_numerator = 3
    @revenue_recognition_rate_denominator = 3
    @revenue_recognition_timing = 0
  end

  def before_revenue_recognition_price
    price
  end
end