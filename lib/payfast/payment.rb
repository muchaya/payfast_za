module Payfast
  class Payment
    ATTRIBUTES = Payfast::Attributes.all_fields.map(&:to_sym)

    attr_reader(*ATTRIBUTES)

    def initialize(args = {})
      args.each do |k,v|
        run_validations(args)
        variable_name = "@#{k}"
        instance_variable_set(variable_name,v) unless v.nil?
      end
    end

    def self.create(args = {})
      Payfast::Config.client.create_payment(args)
    end

    def success?
      status == '200' && message == 'OK'
    end

    def failed?
      !success?
    end

    private

    def run_validations(args)
      filter_attributes(args)
      check_required_attributes(args)
      check_payment_method(args)
    end

    def filter_attributes(args)
      valid_attributes = Payfast::Attributes.all_fields.map(&:to_sym)
      invalid_keys = args.keys - valid_attributes

      unless invalid_keys.empty?
        raise KeyError, "Unknown attribute(s): #{invalid_keys.join(', ')}"
      end
    end

    def check_required_attributes(args)
      required_fields = Payfast::Attributes.required_fields.map(&:to_sym)
      missing_fields = required_fields - args.keys

      unless missing_fields.empty?
        raise KeyError, "Missing required attribute(s): #{missing_fields.join(', ')}"
      end
    end

    def check_payment_method(args)
      if args.key?(:payment_method)
        payment_method = args[:payment_method]
        accepted_methods = Payfast::PaymentMethods::ACCEPTED.keys.map(&:to_sym)
        
        unless accepted_methods.include?(payment_method)
          raise UnknownValueError, "Unknown payment method: #{payment_method}. Accepted methods are #{accepted_methods.join(', ')}"
        end
      end
    end
  end
end
