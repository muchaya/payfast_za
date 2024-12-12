require_relative 'test_helper'
require 'minitest/autorun'
require 'payfast'

class Payfast::Payment::Test < Minitest::Test
  def setup
    @payment_without_email = { amount: "19.99", item_name: "Bunny Chow" }
    @payment_with_wrong_payment_method = { amount: "19.99", item_name: "dogecoin" }
  end

  def test_payment_without_required_attributes
    assert_raises(Payfast::PaymentError) { Payfast::Payment.create(@payment_without_email) }
  end

  def test_payment_with_wrong_payment_method
    assert_raises(Payfast::PaymentError) { Payfast::Payment.create(@payment_with_wrong_payment_method ) }
  end
end
