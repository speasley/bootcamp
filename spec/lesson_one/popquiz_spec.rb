require "spec_helper"

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
  end
end

