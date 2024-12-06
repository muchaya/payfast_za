require "logger"

module Payfast
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
