require 'minitest/autorun'
require './lib/barcode_validator'
require 'pry'

class BarcodeValidatorTest < Minitest::Test
  def test_initializes_with_default_type
    bv = BarcodeValidator.new

    assert_equal 'ean', bv.type
  end

  def test_initializes_with_given_type
    bv = BarcodeValidator.new('itf')

    assert_equal 'itf', bv.type
  end

  def test_error_thrown_if_invalid_type_is_given
    assert_raises(ArgumentError) { BarcodeValidator.new('fake') }
  end
  
  def test_it_validates_ean_barcode_number
    bv = BarcodeValidator.new

    assert_equal true, bv.valid?('7987654321794')
  end
  
  def test_it_validates_with_dashes
    bv = BarcodeValidator.new

    assert_equal true, bv.valid?('4-912345-123459')
  end
end
