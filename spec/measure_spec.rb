require 'spec_helper'

module Shaku
  describe Measure do
    describe "attributes" do
      let(:measure) { Measure.new(10, 'cm') }

      it 'has a measure unit' do
        expect(measure.unit).to eq('cm')
      end

      it 'has a scalar value' do
        expect(measure.scale).to eq(10)
      end
    end

    describe "validations" do
      it 'must have a valid scale' do
        expect { Measure.new('foo', 'cm') }.to raise_error(ArgumentError, 'Scale should be a number')
      end

      it 'must have a valid unit' do
        expect { Measure.new(100, 5) }.to raise_error(ArgumentError, 'Unit argument should be a string')
      end
    end

    describe 'formatting' do
      it 'is human readable' do
        expect(Measure.new(10, 'cm').inspect).to eq('(10.0 cm)')
      end
    end
  end
end
