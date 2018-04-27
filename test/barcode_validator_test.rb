require 'minitest/autorun'
require './lib/barcode_validator'

class BarcodeValidatorTest < Minitest::Test
  def test_it_works
    bv = BarcodeValidator.new

    assert bv
  end
end
