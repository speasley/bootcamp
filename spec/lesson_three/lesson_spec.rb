require 'spec_helper'

class Kid
  attr_accessor :iq
  
  def initialize(iq)
    @iq = iq
  end
end

class School
  def educate(who)
    who.iq *= 2
  end
end

describe "object references" do
  it "passes by reference" do
    kid = Kid.new(50)
    school = School.new
    
    school.educate(kid)
    kid.iq.should == 100
  end
end
