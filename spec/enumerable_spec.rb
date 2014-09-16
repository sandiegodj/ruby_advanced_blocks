require "./spec_helper"


describe Enumerable do

  subject { [1,2,3,4,5] }

    describe "#my_select" do
      context "when block is always true" do
        it "returns original array" do
          expect(subject.my_select {|n| n > 0}).to eq(subject)
        end
      end
      context "when block is always false" do
        it "returns an empty array" do
          expect(subject.my_select {|n| n < 0}).to be_empty
        end
      end
      context "when array is empty" do
        it "returns an empty array" do
          expect([].my_select {|n| n > 0}).to be_empty
        end
      end
      it "returns the appropriate values" do
        expect(subject.my_select {|n| n == 2 or n == 3}).to eq([2,3])
      end
    end 

    describe "#my_all?" do
      context "when block is always true" do
        it "returns true" do
          expect(subject.my_all? {|n| n > 0}).to eq true
        end
      end
      context "when block is always false" do
        it "returns false" do
          expect(subject.my_all? {|n| n < 0}).to eq false
        end
      end
      it "returns appropriate boolean" do
        expect(subject.my_all? {|n| n == 2}).to eq false
      end
    end

    describe "#my_none?" do
      context "when block is always true" do
        it "returns true" do
          expect(subject.my_none? {|n| n < 0}).to eq true
        end
      end
      context "when block is always false" do
        it "returns false" do
          expect(subject.my_none? {|n| n > 0}).to eq false
        end
      end
    end

    describe "#my_count" do
      context "returns correct count" do
        it "returns array count" do
          expect(subject.my_count {|n| n > 0}).to eq 5
        end
        it "returns 0" do
          expect(subject.my_count {|n| n < 0}).to eq 0
        end
        it "returns 1" do
          expect(subject.my_count {|n| n == 2}).to eq 1
        end
      end
    end

    describe "#my_map" do
      context "when given simple addition" do
        it "returns correct array" do
          expect(subject.my_map {|n| n + 1}).to eq([2,3,4,5,6])
        end
      end
      context "when given empty array" do
        it "returns an empty array" do
          expect([].my_map {|n| n + 1}).to eq([])
      end
      end
      it "returns original array" do
        expect(subject.my_map {|n| n + 0}).to eq(subject)
      end
    end

    describe "my_inject" do
      context "when suming a problem" do
        it "returns the sum" do
          expect(subject.my_inject {|i, n| i + n }).to eq(16)
        end
        it "returns the multiplyer sum" do
          expect(subject.my_inject {|i, n| i * n }).to eq(120)
        end
      end
    end
end