require "payfast/config"
require "payfast/errors"

# Set up configs from a dummy account in the Payfast sandbox
Payfast.setup do |config|
  config.merchant_id = "10036320"
  config.merchant_key = "40rjyq0l0pegj"
  config.passphrase = "payfastsouthafrica"
  config.payment_url = "https://sandbox.payfast.co.za/onsite/process"
end
