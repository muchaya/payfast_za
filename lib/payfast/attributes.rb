module Payfast
  class Attributes
    REQUIRED_FIELDS = {
      merchant: [
        'merchant_id',
        'merchant_key' 
      ],
      transaction: [
        'amount',
        'item_name'
      ]
    }.freeze

    OPTIONAL_FIELDS = {
      merchant: [
        'return_url',
        'cancel_url',
        'notify_url',
        'fica_idnumber'
      ],
      customer: [
        'name_first',
        'name_last'    
      ],
      transaction: [
        'm_payment_id',
        'item_description'
      ]
    }.freeze

    CHOICE_FIELDS = {
      customer: [
        'email_address',
        'cell_number'
      ]
    }.freeze

    PAYFAST_RESPONSE = [
      'payment_identifier'
    ]

    class << self
      def required_fields
        REQUIRED_FIELDS.values.flatten
      end

      def all_fields
        (REQUIRED_FIELDS.values + OPTIONAL_FIELDS.values + CHOICE_FIELDS.values + PAYFAST_RESPONSE).flatten
      end
    end
  end
end
