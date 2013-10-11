require "spec_helper"

describe "fibonacci" do
  it "should return the first n numbers in fibonacci" do
    f = ->(x){ x < 2 ? x : f.call(x-1) + f.call(x-2) }
    20.times do |n|
      fibonacci(n).should == f.call(n)
    end
  end

  xit "can enumerate forever" do
    fibonacci_enumerator.take_while { |n| n < 1000 }
  end
end

