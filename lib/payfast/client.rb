require 'net/http'
require 'json'

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

      endpoint_response = JSON.parse(response.body).transform_keys(&:to_sym)

      response_hash = { uuid: endpoint_response[:uuid], status: response.code, message: response.message }

      payment.new(payload.merge(response_hash))
    end

    private 

    def uri
      URI(Payfast.payment_url)
    end

    def payment_data
      URI.encode_www_form(payload.merge({signature: signature}))
    end

    def signature
      Payfast::SignatureGenerator.new(payload).digest
    end

    def payload
      payment_builder.build(payment_params)
    end

    def headers
      { 'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json' }
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
  end
end
