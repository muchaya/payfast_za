# Payfast ZA 

The Payfast ZA gem simplifies the integration of Payfast onsite payments in Ruby on Rails apps.

We've made a [sample rails app](https://github.com/muchaya/ticketfast) to demonstrate how to use this library. Copy and paste from it for the simplest use cases, and it might also help you to join the pieces in the documentation quickly.

## Installation:

### Add the gem to your gemfile:
1. Run `bundle add payfast_za`
2. Run `rails g payfast:install`

The generator will create a config file `config/initializers/payfast.rb`. Edit this file to set up your rails credentials for your environments. Do not forget to set up the actual credentials for each environment as shown in this example.

### Initiating a Payment
The following is an example of how to initiate a simple payment.
`Payfast::Payment.create(email: 'example@mail.com', amount: '2.00', item_name: 'Bunny chow')`

You can add more information for your payment, check the docs to see what other attributes you can add.

Once you've initiated the payment, If everything is setup correctly, You should get a JSON response with the Payfast uuid, which will be handy for us to make the onsite payment work.

### Trigger the payment modal

1. Add the following onsite activation script to you application layout eg. `app/views/layouts/application.html.erb`
`<script src="https://www.payfast.co.za/onsite/engine.js"></script>`

2. To eventually trigger the payment modal, we'll add a bit of javascript and use the JSON response we got when initializing the payment. There two ways to do this. The json response from the intiated payment will give you a `uuid`, `return_url` and `cancel_url`

#### Method 1 - Using URLS
```j
  window.payfast_do_onsite_payment({
    "uuid":"uuid",
    "return_url":"return_url",
    "cancel_url":"cancel_url"
  });
```

Note that the return url and cancel url are optional and you can omit them while testing.

#### Method 2 - Using a callback
```j
  window.payfast_do_onsite_payment({"uuid":"123-abc"}, function (result) {
    if (result === true) {
      // Payment Completed
    }
    else {
      // Payment Window Closed
    }
  }); 
```
A call to the callback will be fired when the payment is successful or when the modal is closed by the user.

### Payment confirmation
A payment notification will be sent to the `notify_url` you specified in your payfast config.

# Documentation
For further informaton on how to use this library, check out the documentation.

## Contributing

If you have an issue you'd like to submit, please do so using the issue tracker in GitHub. In order for us to help you in the best way possible, please be as detailed as you can. Or, you can alternatively open a PR. 


## License

Payfast is released under the [MIT License](https://opensource.org/licenses/MIT).
