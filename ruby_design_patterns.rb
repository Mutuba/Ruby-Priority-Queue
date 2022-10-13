# frozen_string_literal: true

# Person Class
class Person
  def initialize(attributes); end
end

# Boss
class Boss
  def initialize(attributes); end
end

# # Employee class
class Employee
  def initialize(attributes); end
end

# Factory class
class PersonFactory
  TYPES = { employee: Employee, boss: Boss }.freeze
  def self.for(type, attributes)
    (TYPES[type] || Person).new(attributes)
  end
end

employee = PersonFactory.for(:employee, name: 'Daniel')
boss = PersonFactory.for(:boss, name: 'Paul')
person = PersonFactory.for(:foo, name: 'Oliver')
p person

class UseCase
  # include Dry::Transaction

  class << self
    def call(**args)
      new(**args).call
    end
  end
end

module UseCases
  module Buyer
    class Purchase < UseCase
      def initialize(purchase_params)
        @buyer = purchase_params.fetch(:buyer)
        @cart = purchase_params.fetch(:cart)
      end

      def call
        return unless check_stock
        return unless create_purchase

        notify
        result
      end

      private

      attr_reader :buyer, :cart

      def check_stock
        # Services::CheckStock.call(cart: cart)
        p 'stock okay'
      end

      def create_purchase
        # Services::CreatePurchase.call(buyer: buyer, cart: cart).call
        p 'purchase created okay'
      end

      def notify
        # Services::NotifyBuyer.call(buyer: buyer)
        p 'just send a notification to user of the purchase details'
      end

      def result
        { buyer: buyer, cart: cart }
      end
    end
  end
end

purchase = UseCases::Buyer::Purchase.call({ buyer: 'Daniel Mutuba', cart: 'Red Label' })

p purchase[:buyer]
