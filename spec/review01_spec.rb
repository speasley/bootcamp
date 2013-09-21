
require 'spec_helper'

describe "review lesseon 1" do
  context "strings" do
    it "review" do
      puts 'blah #{DateTime.now}'
      puts "blah #{DateTime.now}"
      puts String.new("hello")
      # puts String.public_methods
    end
  end
  
  class Person
    # attr_reader :first_name
    # attr_writer :first_name
    attr_accessor :first_name
    
    def initialize(first_name = "no name")
      @first_naem = first_name
    end
    
    # def first_name
    #   @first_name
    # end
    
    # def first_name=(new_name)
    #   @first_name = new_name
    # end
        
    def change_address(street_address, city = "Calgary")
      @street_address = street_address
      @city = city
    end
    
    def change_clothes(pants: "jeans", shirt: "t-shirt")
      puts "PANTS: #{pants}"
      puts "SHIRT: #{shirt}"    
    end
  end
  
  class CoffeeShop
    def serve_me(size: "regular", type: "espresso", strength: nil, room: false)
      # "Here's your #{strength + " " if(strength)}#{size} #{type}."
      coffee = "Here's your"
      coffee += (strength ? " #{strength}" : "")
      coffee += (size ? " #{size}" : "")
      coffee += (type ? " #{type}" : "")
      coffee += (room ? " with room" : "")
      coffee += "."
      coffee
    end
  end
  

  context "objects" do
    it "review" do
      person = Person.new("mo")
      # person.full_name # instance method
      person.first_name = 'mo'
  
      # person.first_name=('mo')
      # other_person = Person.create # class method (singleton method)
      puts person.object_id

    end
    
    it "can use a default parameter" do
      mo = Person.new("mo")
      mo.change_address("1737 23 ave nw")
    end
    
    it "can use named parameters" do
      mo = Person.new("mo")
      mo.change_clothes(shirt: "bunny hug", pants: "none")
    end
  end
  
  context "CoffeeShop" do
    it "can serve a coffee the way I like it" do
      shop = CoffeeShop.new
      coffee = shop.serve_me(size: "medium", type: "dark roast")
      coffee.should == "Here's your medium dark roast."
    end
    
    it "should serve a coffee with the correct strength" do
      shop = CoffeeShop.new
      coffee = shop.serve_me(size: "large", type: "light roast", strength: 'single')
      coffee.should == "Here's your single large light roast."
    end
    
    it "should specify the room" do
      shop = CoffeeShop.new
      coffee = shop.serve_me(size: "small", room: true)
      coffee.should == "Here's your small espresso with room."
    end
  end
end