module Payfast
  class PaymentError < StandardError; end

  class UnknownAttributeError < StandardError
    def initialize(msg="No such attribute. Refer to docs")
      super
    end
  end

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
