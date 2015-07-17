require "shaku/version"
require "shaku/measure"

module Shaku
  class << self
    def Measure(scale, unit)
      Measure.new(scale, unit)
    end
  end
end
