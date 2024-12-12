require_relative 'test_helper'
require 'minitest/autorun'
require 'payfast'

class Payfast::SignatureGenerator::Test < Minitest::Test
  def setup
    @data = Payfast::PaymentBuilder.build({email: 'example@mail.com',amount: "19.99", item_name: "Bunny Chow"})
  end

  def test_calculates_correct_signature
    signature = Payfast::SignatureGenerator.new(@data).digest

    assert_equal(signature, "94a0ecda7b6e76297b2174d39d464493") 
  end
end
