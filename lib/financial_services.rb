# FinancialServices.new('paypal', 42)
# It will pay AMOUNT=42 and PAY it via PAYPAL
#
# See test/financial_services_test.rb for usage example
class FinancialServices
  def initialize(args)
    @payment_gateway = GatewayFactory.create args[:payment_gateway]
    @amount = args[:amount]
  end

  def pay
    @payment_gateway.pay(@amount)
  end

  def discount_price(discount)
    @PaymentGateway.pay(@amount * discount)
  end
end

# Factory to create gateways.
class GatewayFactory
  def self.create(payment_gateway)
    case payment_gateway.downcase
    when 'paypal'
      Paypal.new
    when 'stripe'
      Stripe.new
    else
      raise 'This gataeway is not supported'
    end
  end
end

# An interface for any gateway
class PaymentGateway
  def pay(_amount)
    raise 'Should implement pay method!'
  end
end

# Implementing Payypal API
class Paypal < PaymentGateway
  def pay(amount)
    "Paid #{amount} by Paypal"
  end
end

# Implementing Stripe API
class Stripe < PaymentGateway
  def pay(amount)
    "Paid #{amount} by Stripe"
  end
end
