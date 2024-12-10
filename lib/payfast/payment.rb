module Payfast
  class Payment
    ATTRIBUTES = Payfast::Attributes.all_fields.map(&:to_sym)

    attr_reader(*ATTRIBUTES)

    def initialize(args = {})
      args.each do |k,v|
        run_validations(k, v)
        variable_name = "@#{k}"
        instance_variable_set(variable_name,v) unless v.nil?
      end
    end

    def self.create(*args)
      Payfast::Config.client.create_payment(*args)
    end

    def success?
      status == '200' && message == 'OK'
    end

    def failed?
      !success?
    end

    private

    def run_validations(key, value)
      filter_attribute(key)
      check_payment_method(value) if key == :payment_method
    end

    def filter_attribute(key)
      return if ATTRIBUTES.include?(key)

      raise UnknownAttributeError, "Unknown attribute: #{key}"
    end

    def check_payment_method(value)
      return if Payfast::PaymentMethods::ACCEPTED.keys.include?(value.to_sym) || value.nil?

      raise UnknownValueError, "Unknown payment method: #{value}. Accepted methods are #{Payfast::PaymentMethods::ACCEPTED.keys.join(', ')}"
    end
  end
end
