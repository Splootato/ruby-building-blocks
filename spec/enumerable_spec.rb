require './enumerable'

RSpec.describe Enumerable do
    describe "#my_each" do
        it "executes the block on each element in an arry" do
            result = []
            [1,2,3].my_each { |i| result << i+1 }
            expect(result).to eql([2,3,4])
        end
    end

    describe "#my_select" do
        it "returns an empty array if no elements match" do
            expect([1,2,3].my_select { |i| i > 3 }).to eql([])
        end
        it "returns elements that match the condition" do
            expect([1,2,3].my_select { |i| i % 2 != 0 }).to eql([1,3])
        end
    end

    describe "#my_all?" do
        it "returns false if all elements do not match" do
            expect([1,2,3].my_all? { |i| i % 2 == 0 }).to eql(false)
        end
        it "returns true if all elements match" do
            expect([2,4,6].my_all? { |i| i % 2 == 0 }).to eql(true)
        end
    end

    describe "#my_any?" do
        it "returns false if no elements match" do
            expect([1,2,3].my_any? { |i| i > 3 }).to eql(false)
        end
        it "returns true if an element matches" do
            expect([1,2,3].my_any? { |i| i > 2 }).to eql(true)
        end
    end

    describe "#my_none?" do
        it "returns true if no elements match" do
            expect([1,2,3].my_none? { |i| i > 3 }).to eql(true)
        end
        it "returns false if an element matches" do
            expect([1,2,3].my_none? { |i| i > 2 }).to eql(false)
        end
    end

    describe "#my_inject" do
        it "returns the sum of elements in an array" do
            expect([1,2,3,4].my_inject { |sum, i| sum + i}).to eql(10)
        end
        it "returns the product of elements in an array" do
            expect([1,2,3,4].my_inject(1) { |product, i| product * i }).to eql(24)
        end
    end
end