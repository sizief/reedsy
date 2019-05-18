require 'test_helper'

class FinancialServicesTest < MiniTest::Test
  def test_pay
    gateway = 'Paypal'
    amount = 42

    payment = FinancialServices.new(payment_gateway: gateway, amount: amount)
    assert_equal payment.pay, "Paid #{amount} by #{gateway}"
  end

  def test_error_gateway
    assert_raises do
      FinancialServices.new(payment_gateway: 'Unkown', amount: 42)
    end
  end
end
