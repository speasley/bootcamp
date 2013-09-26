require "spec_helper"

class Movie
  def initialize(name)
    @name = name
  end
end

class MovieLibrary
  def initialize(movies = [])
    @movies = movies
  end

  def add(movie)
    @movies.push(movie) unless include? movie
  end
  
  def total_count
    @movies.size
  end
  
  def include?(movie)
    
  end
  
end


describe MovieLibrary do
  context "when adding a movie to the library" do
    it "should increase the total number of movies in the library" do
      library = MovieLibrary.new
      shawshank_redemption = Movie.new("The Shawshank Redemption")
      chasing_amy = Movie.new("Chasing Amy")
    
      library.add(shawshank_redemption)
      library.add(chasing_amy)
      library.total_count.should == 2
    end

    it "should not allow duplicate movies into the library" do
      library = MovieLibrary.new
      man_on_fire = Movie.new("Man on Fire")
      library.add(man_on_fire)
      library.add(man_on_fire)
      library.total_count.should == 1
    end
  end
  
  
  
end