class Contract
  attr_reader :product_name, :category_name, :price, :signed_on

  def initialize(product_name, category_name, price, signed_on)
    @product_name = product_name
    @category_name = category_name
    @price = price
    @signed_on = signed_on
  end
end