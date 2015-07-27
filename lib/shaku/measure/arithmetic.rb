module Shaku
  class Measure
    module Arithmetic
      def +(other)
        ensure_same_type!(other)

        self.class.new(scale + other.scale, unit)
      end

      def +@
        self
      end

      def -@
        self.class.new(-scale, unit)
      end

      def *(number)
        Measure.new(scale*number, unit)
      end
    end
  end
end
