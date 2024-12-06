require "logger"

module Payfast
  class << self
    attr_accessor :merchant_id, :merchant_key, :passphrase, :payment_url, :cancel_url, :notify_url, :return_url

    def setup(&block)
      instance_eval(&block)
    end
  end

  class Config
    attr_writer :logger

    class << self
      def logger
        @logger ||= Logger.new($stdout)
      end

      def client
        Payfast::Client
      end
    end
  end
end
