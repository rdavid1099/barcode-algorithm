class BarcodeValidator
  attr_reader :type

  def initialize(type = 'ean')
    @type = if TYPES.include?(type.downcase)
      type.downcase
    else
      error(ArgumentError, 'Invalid barcode type')
    end
  end
  
  def verify(val)
    sanitized = sanitize(val).reverse
    check_digit = sanitized.pop
    (10 - (calculate_values(sanitized) % 10)) == check_digit.to_i
  end
  
  private
  TYPES = [
    'upc',
    'ean',
    'itf'
  ]
  
  def calculate_values(sanitized)
    counter = sanitized.length + 1
    sanitized.reduce(0) do |result, digit|
      result + (digit.to_i * ((counter -= 1).even? ? 1 : 3))
    end
  end
  
  def sanitize(val)
    val.chars.map do |char|
      char if /[0-9]/.match(char)
    end.compact
  end
  
  def error(type, msg)
    raise type, msg
  end
end
