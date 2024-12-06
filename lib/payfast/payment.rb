module Payfast
  class Payment
    ATTRIBUTES = Payfast::Attributes.all_fields.map(&:to_sym)

    attr_reader(*ATTRIBUTES)

    def initialize(args = {})
      args.each do |k,v|
        if ATTRIBUTES.include?(k)
          variable_name = "@#{k}"
          instance_variable_set(variable_name,v) unless v.nil?
        else
          raise ArgumentError, "Unknown parameter: #{k}"
        end
      end
    end

    def self.create(*args)
      Payfast::Config.client.create_payment(*args)
    end

    def success?
      !failed?
    end

    def failed?
      payment_identifier.nil?
    end 
  end
end
