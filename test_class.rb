# class Foo
#   def method_missing name, *args, &block
#     p args
#   end

#   def respond_to_missing? name, *args, &block
#     true
#   end
# end

# f = Foo.new
# f.bar  #=> []
# p f.respond_to? :bar  #=> true
# p f.method :bar  # NameError: undefined method `bar' for class `Foo'

module MutubaTest
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def set_association
      mutuba_private
    end

    private

    def mutuba_private
      puts 'I am private called from an inner module'
    end
  end
end

class Test
  include MutubaTest
end

p Test.set_association

# Adapter pattern in play using Ruby

# Existing e-commerce platform interface

class ECommercePlatform
  def process_payment(amount)
    raise NotImplementedError, "This method should be implemented by concrete subclasses"
  end
end

# New payment gateway interface

class NewPaymentGateway
  def execute_payment(amount)
    puts "Executing payment of $#{amount} via the new payment gateway."
  end
end

# Adapter class

class PaymentGatewayAdapter < ECommercePlatform
  def initialize(payment_gateway)
    @payment_gateway = payment_gateway
  end

  def process_payment(amount)
    @payment_gateway.execute_payment(amount)
  end
end

# Usage example
ecommerce_platform = ECommercePlatform.new

# Integration of the new payment gateway via the adapter
new_payment_gateway = NewPaymentGateway.new
adapter = PaymentGatewayAdapter.new(new_payment_gateway)

amount = 100.0

# Invoke the adapter
adapter.process_payment(amount)  #=> Executing payment of $100.0 via the new payment gateway