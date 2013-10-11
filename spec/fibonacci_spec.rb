require "spec_helper"

def fibonacci(n)
end

def fibonacci_enumerator
end

describe "fibonacci" do
  it "should return the first n numbers in fibonacci" do
    f = ->(x){ x < 2 ? x : f.call(x-1) + f.call(x-2) }
    20.times do |n|
      fibonacci(n).should == f.call(n)
    end
  end

  it "can enumerate forever" do
    results = fibonacci_enumerator.take(18)
    f = ->(x){ x < 2 ? x : f.call(x-1) + f.call(x-2) }
    18.times do |n|
      results.should include(f.call(n))
    end
  end
end

