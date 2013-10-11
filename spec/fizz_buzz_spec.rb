require "spec_helper"

class FizzBuzz
  def run(input)
  end
end

describe "FizzBuzz" do
  let(:sut) { FizzBuzz.new }

  context "when the input is a multiple of 3" do
    it "should return Fizz" do
      (1..10).each do |n|
        result = sut.run(n*3)
        result.should include("Fizz")
      end
    end
  end

  context "when the input is a multiple of 5" do
    it "should say Buzz" do
      (1..10).each do |n|
        result = sut.run(n*5)
        result.should include("Buzz")
      end
    end
  end

  context "when the input is not a multiple of 3" do
    it "should not say Fizz" do
      100.times do |n|
        next if n % 3 == 0
        sut.run(n).should_not include("Fizz")
      end
    end
  end

  context "when the input is not a multiple of 5" do
    it "should not say Buzz" do
      100.times do |n|
        next if n % 5 == 0
        sut.run(n).should_not include("Buzz")
      end
    end
  end
end
