require "spec_helper"

class CarWash
  def initialize(name = "Unknown Name", address = "Unknown Address")
    @name = name
    @address = address    
  end
  def description
    "#{@name} is located at #{@address}"
  end
  
  def self.wash(car)
    @carr = car
    @@car = car
    "Your #{@@car} is clean."
  end
  
  def self.last_car_washed
    @carr  
  end
  
  def last_car_scrubbed
    CarWash.instance_variable_get("@carr")
  end
end

class Drink
  attr_reader :name
  attr_accessor :color
  attr_accessor :rating
  
  def initialize(name)
    @name = name
    # @color = color()
    # @rating = rating()
  end
end

describe 'pop quiz 1' do
  context :instance_methods do
    it "can define an instance method" do
      car_wash = CarWash.new("Petro-Canada", "123 Street NW")
      car_wash.description.should == "Petro-Canada is located at 123 Street NW"
    end
  end

  context :class_methods do
    it "can define a class method" do
      car = "Honda"
      washed_car = CarWash.wash(car)
      washed_car.should == "Your #{car} is clean."
    end
    
    it "can access a class variable" do
      car = "Toyota"
      CarWash.wash(car)
      CarWash.last_car_washed.should == car
    end
    
    it "should return the last car washed at a specific car wash" do
      car = "Jeep"
      CarWash.wash(car)
      CarWash.new.last_car_scrubbed.should == car
    end
  end

  context :attr_ do
    it "can define a getter" do
      drink = Drink.new("water")
      drink.name.should == "water"
    end

    it "can define a setter" do
      drink = Drink.new("kool-aid")
      drink.color="pink"
      drink.instance_variable_get("@color").should == "pink"
    end

    it "can define something that is a getter and setter" do
      drink = Drink.new("chocolate milk")
      drink.rating=5
      drink.rating.should == 5
    end
    
    it "should have a default colour" do
      drink = Drink.new("tea")
      drink.color.should == nil
    end
  end
end

