module Payfast
  class PaymentError < StandardError
    def initialize(msg="Something went wrong")
      super
    end
  end
end
