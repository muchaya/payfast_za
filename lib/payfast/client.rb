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
    

      response = Net::HTTP.post(uri, payment_identifier, headers)
    
      if response.code =~ /^[4-5]/
        logger.error("[PAYFAST] FAILED POST to #{uri} - status: #{response.code}, message: #{response.message}")
      else
        logger.info("[PAYFAST] COMPLETED POST to #{uri} - status: #{response.code}, message: #{response.message}")
      end

      uuid = response[:location].split('/').last

      payment = payment.new(payment_params.merge!(uuid: uuid))
    
    rescue Payfast::PaymentError => error
      logger.error("[PAYFAST] EXCEPTION during POST to #{uri}: #{error.class} - #{error.message}")
      raise
    end

    private 

    def uri
      URI(Payfast.payment_url)
    end

    def payment_identifier
      URI.encode_www_form(raw_payment.merge({signature: signature}))
    end

    def raw_payment
      payment_builder.build(payment_params)
    end

    def signature
      Payfast::SignatureGenerator.new(payment_params).digest
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
  end
end
