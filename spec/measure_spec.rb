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

    describe "Equality" do
      let(:measure) { Measure.new(10, 'cm') }

      it "equals a measure with same scale and unit" do
        expect(measure).to eq(Measure.new(10, 'cm'))
      end

      it "does not equal a measure with a unit" do
        expect(measure).to_not eq(Measure.new(10, 'kg'))
      end

      it 'does not equal to a number' do
        expect(measure).to_not eq(10)
      end

      it "has a consistent hash" do
        expect(measure.hash).to eq(Measure.new(10, 'cm').hash)
      end
    end

    describe 'constructor' do
      it 'create a new Measure' do
        expect(Shaku::Measure(10, 'cm').scale).to eq(10)
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
