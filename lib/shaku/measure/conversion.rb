module Shaku
  class Measure
    module Conversion
      # Explicit conversion into a Measure
      #
      # @return [Measure] The reciever
      #
      def to_measure
        self
      end

      # Convert the Measure into a Float
      #
      # @return [Float] The magnitude of the Measure
      #
      def to_f
        scale
      end

      # Convert the Measure into an Integer
      #
      # @return [Integer] The magnitude of the Measure truncated to an Integer
      #
      def to_i
        scale.to_i
      end
    end
  end
end
