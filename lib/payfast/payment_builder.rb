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
      merchant_details.merge(customer_details, transaction_details, payment_methods).compact
    end

    private

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

    def transaction_details
      {
        amount: params[:amount],
        item_name: params[:item_name],
        m_payment_id: params[:payment_id],
        item_description: params[:description],
        custom_int1: params[:metadata_int1],
        custom_int2: params[:metadata_int2],
        custom_int3: params[:metadata_int3],
        custom_int4: params[:metadata_int4],
        custom_int5: params[:metadata_int5],
        custom_str1: params[:metadata_str1],
        custom_str2: params[:metadata_str2],
        custom_str3: params[:metadata_str3],
        custom_str4: params[:metadata_str4],
        custom_str5: params[:metadata_str5]
      }
    end

    def transaction_options
      {
        email_confirmation: params[:email_confirmation],
        confirmation_address: Payfast.email_confirmation_address
      }
    end

    def payment_methods
      { payment_method: Payfast.payment_method }
    end
  end
end
