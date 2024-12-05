module Payfast
  class Payment
    ATTRIBUTES = Payfast::Attributes.all_fields

    attr_reader *ATTRIBUTES

    def initialize(**kwargs)
      kwargs.each do |key, value|
        if ATTRIBUTES.include?(key.to_sym)
          instance_variable_set("@#{key}", value)
        else
          raise ArgumentError, "Unknown parameter: #{key}"
        end
      end
    end

    def self.create(**kwargs)
      Payfast::Config.client.create_payment(**kwargs)
    end


    def success?
      status == 'Ok'
    end

    def failed?
      !success
    end 
  end
end
