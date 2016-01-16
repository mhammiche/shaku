require "shaku/version"
require "shaku/measure"

module Shaku
  # Create a new Measure object with a value in a given unit
  #
  # @param [Numeric] scale Magnitude of the measurement
  # @param [String] unit The unit of measurement
  #
  # @example
  #   extend Shaku
  #
  #   Measure(10, 'cm') # => (10.0 cm)
  #   Measure(2.5 'kg') # => (2.5 kg)
  #
  # @return [Measure]
  #
  # @raise [ArgumentError] when +scale+ is not a number, or the unit is not a string
  #
  def Measure(scale, unit)
    Measure.new(scale, unit)
  end
end
