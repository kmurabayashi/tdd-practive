require 'time'
class RevenueService
  def revenue_recognition(contract, check_date_string)
    return nil unless contract.is_a?(Contract)

    check_date = Time.parse(check_date_string)
    signed_on = Time.parse(contract.signed_on)

    return 0 if before_contract?(signed_on, check_date)

    return contract.price if contract.category_name == "ワードプロセッサ" || thirty_days_after_contract?(signed_on, check_date)

    (contract.price / 3 * 2) + contract.price % 3
  end

  private
  def before_contract?(signed_on, check_date)
    signed_on > check_date
  end

  def thirty_days_after_contract?(signed_on, check_date)
    thirty_days = (60*60*24*30)
    signed_on + thirty_days <= check_date
  end
end