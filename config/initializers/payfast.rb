#Use this hook to configure the parameters necessary for your payments to work
#Uncomment all the commented configs and use values applicable to your own application
#Payfast credentials can be obtained from the Payfast website 
#Consider using rails credentials for sensitive secrets 
Payfast.setup do |config|

  # ==> Configure Payfast Secrets
  #config.payment_url = Rails.application.credentials.payfast[:payment_url]

  #config.merchant_id = Rails.application.credentials.payfast[:merchant_id]
  #config.merchant_key = Rails.application.credentials.payfast[:merchant_key]

   #config.passphrase = Rails.application.credentials.payfast[:passphrase]

  # ==> Configure Payfast Urls
  #config.return_url = Rails.application.credentials.payfast[:return_url]
  #config.cancel_url = Rails.application.credentials.payfast[:cancel_url]
  #config.notify_url = Rails.application.credentials.payfast[:notify_url]

  # ==> Configure Payfast transaction emails  
  #config.email_confirmation = Rails.application.credentials.payfast[:email_confirmation]
  #config.confirmation_address = Rails.application.credentials.payfast[:confirmation_address]

  # ==> Configure Payfast payment methods
  #config.payment_method = Rails.application.credentials.payfast[:payment_method]
end
