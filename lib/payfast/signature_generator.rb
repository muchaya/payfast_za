require 'uri'
require 'digest/md5'

module Payfast
  class SignatureGenerator
    attr_reader :payment_params

    def initialize(payment_params)
      @payment_params = payment_params
    end

    def digest
      Digest::MD5.hexdigest(encoded_params)
    end

    private

    def encoded_params
      URI.encode_www_form(payment_params.merge(passphrase: passphrase))
    end

    def passphrase
      #Payfast.passphrase
      "tiffymuchaya"
    end
  end
end
