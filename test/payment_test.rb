require_relative 'test_helper'
require 'minitest/autorun'
require 'payfast'

class Payfast::Payment::Test < Minitest::Test
  def setup
    @merchant_details = { merchant_id: "123", merchant_key: "123-abc" }
  end

  def test_unknown_attributes
    assert_raises(KeyError) { Payfast::Payment.new(@merchant_details.merge(amount: "19.99", item_name: "Bunny Chow", access_id: "123-abc")) }
  end

  def test_payment_without_required_attribute
    assert_raises(KeyError) { Payfast::Payment.new(@merchant_details.merge(item_name: "Bunny Chow")) }
  end

  def test_payment_with_wrong_payment_method
    assert_raises(Payfast::UnknownValueError) { Payfast::Payment.new(@merchant_details.merge(amount: "19.99", item_name: "Bunny Chow", email_address: 'example@mail.com', payment_method: "dogecoin" )) }
  end

  def test_payment_with_correct_payment_mthod
    payment = Payfast::Payment.new(@merchant_details.merge(amount: "19.99", item_name: "Bunny Chow", email_address: 'example@mail.com', payment_method: :ef))
    assert_instance_of Payfast::Payment, payment
  end

  def test_payment_with_correct_attributes
    payment = Payfast::Payment.new(@merchant_details.merge(amount: "19.99", item_name: "Bunny Chow", email_address: 'example@mail.com'))
    assert_instance_of Payfast::Payment, payment
  end
end
