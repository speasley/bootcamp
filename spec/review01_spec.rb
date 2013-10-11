
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
    def initialize(defaults = {size: "regular", type: "espresso", strength: nil, room: false})
      @defaults = defaults
    end
    
    # def serve_me(size: "regular", type: "espresso", strength: nil, room: false)
    def serve_me(options = {})
      order = @defaults.merge(options)
      coffee = "Here's your"
      [:strength, :size, :type].each do |key|
        coffee += (order[key] ? " #{order[key]}" : "")
      end
      coffee += (order[:room] ? " with room" : "")
      coffee += "."
      coffee
    end
  end

  class Movies
    def initialize()
      @movies = ["jurassic park", "rocky", "rocky II"]
    end
    
    def accept(visitor)
      @movies.each do |movie|
        visitor.visit(movie)
      end
    end
  end
  
  class LoggingVisitor
    def visit(item)
      puts item
    end
  end
  
  class TotalCount
    attr_reader :total
    
    def initialize
      @total = 0
    end
    
    def visit(item)
      @total = @total + 1
    end
  end
  
  context "visitor" do
    it "can visit each movie" do
      movies = Movies.new
      visitor = LoggingVisitor.new
      total_movies = TotalCount.new
      
      movies.accept(visitor)
      movies.accept(total_movies)
      
      puts total_movies
      
      [1, 3, 4].each do |x|
        puts x * x
      end
      
      [1, 2, 4].map do |x|
        x * x
      end
      
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
    def shop
      CoffeeShop.new
    end
    
    it "can serve a coffee the way I like it" do
      coffee = shop.serve_me(size: "medium", type: "dark roast")
      coffee.should == "Here's your medium dark roast."
    end
    
    it "should serve a coffee with the correct strength" do
      coffee = shop.serve_me(size: "large", type: "light roast", strength: 'single')
      coffee.should == "Here's your single large light roast."
    end
    
    it "should specify the room" do
      coffee = shop.serve_me(size: "small", room: true)
      coffee.should == "Here's your small espresso with room."
    end
  end
end
