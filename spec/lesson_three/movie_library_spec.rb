require "spec_helper"
require "movielibrary"
require "movie"

describe MovieLibrary do
  
  include MovieLibrary
  include Movie
  
  context "when adding a movie to the library" do
    it "should increase the total number of movies in the library" do
      library = MovieLibrary::MovieLibrary.new
      shawshank_redemption = Movie::Movie.new("The Shawshank Redemption")
      chasing_amy = Movie::Movie.new("Chasing Amy")
    
      library.add(shawshank_redemption)
      library.add(chasing_amy)
      library.total_count.should == 2
    end

    it "should not allow duplicate movies into the library" do
      library = MovieLibrary::MovieLibrary.new
      man_on_fire = Movie::Movie.new("Man on Fire")
      library.add(man_on_fire)
      library.add(man_on_fire)
      library.total_count.should == 1
    end
  end
  
end