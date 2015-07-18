module Shaku
  class Measure
    attr_reader :scale, :unit

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
  end
end
