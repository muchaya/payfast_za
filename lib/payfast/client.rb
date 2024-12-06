require 'net/http'

module Payfast
  class Client
    attr_reader :payment_params

    def self.create_payment(payment_params)
      new(payment_params).create_payment
    end

    def initialize(payment_params)
      @payment_params = payment_params
    end

    def create_payment
      logger.info("[PAYFAST] STARTED POST to #{uri}")

      response = Net::HTTP.post(uri, payment_data, headers)
    
      if response.code =~ /^[4-5]/
        raise Payfast::PaymentError, "[PAYFAST] Error: Failed POST to #{uri}. HTTP #{response.code} - #{response.message}"
      else
        logger.info("[PAYFAST] COMPLETED POST to #{uri} - status: #{response.code}, message: #{response.message}")
      end

      payment.new(raw_payment.merge(payment_identifier: payment_identifier(response)))
    end

    private 

    def uri
      URI(Payfast.payment_url)
    end

    def payment_data
      URI.encode_www_form(raw_payment.merge({signature: signature}))
    end

    def signature
      Payfast::SignatureGenerator.new(raw_payment).digest
    end

    def raw_payment
      payment_builder.build(payment_params)
    end

    def headers
      {'content-type': 'application/x-www-form-urlencoded'}
    end

    def logger
      Payfast::Config.logger
    end

    def payment_builder
      Payfast::PaymentBuilder
    end

    def payment
      Payfast::Payment
    end

    def payment_identifier(response)
      response[:location]&.split('/').last
    end
  end
end
