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
        'fica_idnumber',
      ],
      customer: [
        'name_first',
        'name_last',
        'email_address',
        'cell_number'
      ],
      transaction: [
        'm_payment_id',
        'item_description',
        'custom_int1',
        'custom_int2',
        'custom_int3',
        'custom_int4',
        'custom_int5',
        'custom_str1',
        'custom_str2',
        'custom_str3',
        'custom_str4',
        'custom_str5'
      ],
      transaction_options: [
        'email_confirmation'
      ],
      payment_methods: [
        'payment_method'
      ]
    }.freeze

    PAYFAST_RESPONSE = [
      'uuid'
    ],

    HTTP_RESPONSE = [
      'status',
      'message'
    ]

    class << self
      def required_fields
        REQUIRED_FIELDS.values.flatten
      end

      def all_fields
        (REQUIRED_FIELDS.values + OPTIONAL_FIELDS.values + PAYFAST_RESPONSE + HTTP_RESPONSE).flatten
      end
    end
  end
end
