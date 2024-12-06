require "payfast/attributes"
require "payfast/client"
require "payfast/config"
require "payfast/payment_builder"
require "payfast/payment_methods"
require "payfast/payment"
require "payfast/signature_generator"

module Payfast
  attr_accessor :merchant_id, :merchant_key, :passphrase, :payment_url, :cancel_url, :notify_url, :return_url

  def self.setup
    yield self
  end
end
 