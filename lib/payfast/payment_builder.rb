module Payfast
  class PaymentBuilder
    attr_reader :params

    def self.build(params)
      new(params).build
    end

    def initialize(params)
      @params = params
    end

    def build
      merchant_details.merge(customer_details, transaction_details).compact
    end

    private

    def 

    def merchant_details
      { 
        merchant_id: Payfast.merchant_id, 
        merchant_key: Payfast.merchant_key,
        return_url: Payfast.return_url,
        cancel_url: Payfast.cancel_url,
        notify_url: Payfast.notify_url,
        fica_idnumber: params[:fica_idnumber]
      }
    end

    def customer_details
      {
        name_first: params[:first_name],
        name_last: params[:last_name],
        email_address: params[:email],
        cell_number: params[:cell_number]
      }

    end
  
    # todo decide on adding the email confirmation attribute customer integers, and payment methods
    def transaction_details
      {
        amount: params[:amount],
        item_name: params[:item_name],
        m_payment_id: params[:payment_id],
        item_description: params[:description]
      }
    end
  end
end
