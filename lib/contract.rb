class Contract
  attr_reader :product, :signed_on

  def initialize(product, signed_on)
    @product = product
    @signed_on = signed_on
  end

  def specific_date_revenue_recognition(target_date)
    return 0 if before_contract?(target_date)

    if before_revenue_recognition?(target_date)
      product.before_revenue_recognition_price
    else
      product.price
    end
  end

  private

  def before_revenue_recognition?(target_date)
    revenue_recognition_day = (60*60*24*product.revenue_recognition_timing)
    @signed_on + revenue_recognition_day >= target_date
  end

  def before_contract?(target_date)
    @signed_on > target_date
  end
end