class BarcodeValidator
  attr_reader :type

  def initialize(type = 'ean')
    @type = type.downcase
  end
end
