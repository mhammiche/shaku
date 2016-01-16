module Shaku
  class Measure
    module Arithmetic

      # Sum two measures of same unit
      #
      # @param [Measure] other The measure to add
      #
      # @raise [TypeError] When other cannot be coerced to a Shaku::Measure
      # @raise [ArgumentError] When unit are not compatible
      #
      def +(other)
        ensure_same_type!(other)

        self.class.new(scale + other.scale, unit)
      end

      # Substract two measures of same unit
      #
      # @param [Measure] other The measure to substract
      #
      # @raise [TypeError] When other cannot be coerced to a Shaku::Measure
      # @raise [ArgumentError] When unit are not compatible
      #
      def -(other)
        ensure_same_type!(other)

        self.class.new(scale - other.scale, unit)
      end

      # Unary plus operator
      #
      # @return the reciever
      #
      def +@
        self
      end

      # Unary minus operator
      #
      # @return the measure negated
      #
      def -@
        self.class.new(-scale, unit)
      end

      # Multiply the measure by a scalar value
      #
      # @return [Measure] Return a mesure with the same unit
      #
      # @example
      #
      # a = Shaku::Measure.new(10, 'cm')'
      # a * 2 # => (20.0 cm)
      #
      def *(number)
        Measure.new(scale*number, unit)
      end

      # Divide the measure by a scalar value
      #
      # @return [Measure] Return a mesure with the same unit
      #
      # @example
      #
      # a = Shaku::Measure.new(10, 'cm')'
      # a / 2 # => (5.0 cm)
      #
      def /(number)
        Measure.new(scale/number.to_f, unit)
      end
    end
  end
end
