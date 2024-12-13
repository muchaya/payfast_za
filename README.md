# Payfast ZA 

The Payfast ZA gem simplifies the integration of Payfast onsite payments in Ruby on Rails apps.

We've made a [sample rails app](https://github.com/muchaya/ticketfast) to demonstrate how to use this library. Copy and paste from it for the simplest use cases, and it might also help you to join the pieces in the documentation quickly.

### Installation

Add the gem to your gemfile and run the generator

1. Run `bundle add payfast_za`
2. Run `rails g payfast:install`

The generator will create a config file `config/initializers/payfast.rb`. Edit this file to set up your rails credentials for your environments. Do not forget to set up the actual credentials for each environment.

### Initiating a Payment
The following is an example of how to initiate a simple payment.
```ruby
payment = Payfast::Payment.create(email: 'example@mail.com', amount: '20.00', item_name: 'Bunny chow')
```

You can add more attributes for your payment, check the [Docs](docs/1_payment_attributes.md) to see what other attributes you can add.

### Checking Payment status
To check if the payment was successful, use `payment.success?` or `payment.failed?` to check for payment failure.

```ruby
  if payment.success?
    ... 
  end
```

### Retrieving payment details
Once you've initiated the payment, If everything is setup correctly, you should access payment details as follows. The details will be handy for us to make the online payments work. We strongly recommend using something like [StimulusJS](https://stimulus.hotwired.dev) as shown in the [sample rails app](https://github.com/muchaya/ticketfast). So you can render json in a controlller applicable to your app.

```ruby
  render json: { uuid: payment.uuid, return_url: payment.return_url, cancel_url: payment.cancel_url }
``` 


### Trigger the payment modal

1. Add the following onsite activation script to you application layout eg. app/views/layouts/application.html.erb
`<script src="https://www.payfast.co.za/onsite/engine.js"></script>`


2. To eventually trigger the payment modal, we use a bit of javascript. We use the `uuid`, `return_url` and `cancel_url` from Payment object as indicated earlier. 

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

## Testing
Applications using Payfast Onsite payments can only be served over HTTPS. The intergration will not work unless if your localhost is exposed to the internet. You can reach out for a tool like ngrok.

## Documentation
For further information on how to use this library, check out the documentation.
1. [Payment Attributes](docs/1_payment_attributes.md) - For supported payment attributes and payment methods to use when creating a payment object. 

## Contributing

If you have an issue you'd like to submit, please do so using the issue tracker in GitHub. In order for us to help you in the best way possible, please be as detailed as you can. Or, you can alternatively open a PR. 


## License

Payfast is released under the [MIT License](https://opensource.org/licenses/MIT).
