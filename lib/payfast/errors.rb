module Payfast
  class PaymentError < StandardError; end

  class UnknownValueError < StandardError
    def initialize(msg="Unknown. Refer to docs")
      super
    end
  end 
  
  class MissingAttributeError < StandardError
    def initialize(msg="Required Attribute is missing. Refer to docs")
      super
    end
  end 
end
