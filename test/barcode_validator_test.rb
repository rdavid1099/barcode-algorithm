require 'minitest/autorun'
require './lib/barcode_validator'

class BarcodeValidatorTest < Minitest::Test
  def test_initializes_with_default_type
    bv = BarcodeValidator.new

    assert_equal 'ean', bv.type
  end

  def test_initializes_with_given_type
    bv = BarcodeValidator.new('itf')

    assert_equal 'itf', bv.type
  end
end
