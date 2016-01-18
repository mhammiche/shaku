require 'shaku/measure/arithmetic'
require 'shaku/measure/conversion'

# A Measure is an object that represents a measurement of a physical property.
# It is defined by a number : the magnitude - or scale - of the property, and
# a unit.
#
# A measure is a Value Object, hence it is immutable.
#
module Shaku
  class Measure
    include Comparable
    include Arithmetic
    include Conversion

    # @!attribute [r] scale
    #   @return [Float] the magnitude of the measurement
    attr_reader :scale

    # @!attribute [r] unit
    #   @return [String] the unit the measurement
    attr_reader :unit

    # Create a new Measure object with a value in a given unit
    #
    # @param [Numeric] scale Magnitude of the measurement
    # @param [String] unit The unit of measurement
    #
    # @example
    #   Shaku::Measure.new(10, 'cm') # => (10.0 cm)
    #   Shaku::Measure new(2.5 'kg') # => (2.5 kg)
    #
    # @return [Measure]
    #
    # @raise [ArgumentError] when +scale+ is not a number, or the unit is not a string
    #
    def initialize(scale, unit)
      raise ArgumentError, 'Scale should be a number' unless scale.respond_to?(:to_int)
      raise ArgumentError, 'Unit argument should be a string' unless unit.respond_to?(:to_str)
      @scale = scale.to_f
      @unit = unit
    end

    def inspect
      "(#{scale} #{unit})"
    end

    def ==(other)
      return false unless other.class == self.class
      scale == other.scale && unit == other.unit
    end

    alias :eql? :==

    def hash
      [scale, unit].hash
    end

    def <=>(other)
      ensure_same_type!(other)

      scale <=> other.scale
    end

    private

    def ensure_same_type!(other)
      raise TypeError, "Cannot convert #{other.class} to Measure" unless other.respond_to?(:to_measure)
      raise ArgumentError, 'Inconsistent unit' unless other.unit == unit
    end

  end
end
