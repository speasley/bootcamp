require "spec_helper"

describe MovieLibrary do
  context "when adding a movie to the library" do
    let(:library) { MovieLibrary.new }
    let(:shawshank_redemption) { Movie.new("The Shawshank Redemption") }
    let(:chasing_amy) { Movie.new("Chasing Amy") }
    let(:man_on_fire) { Movie.new("Man on Fire") }

    it "should increase the total number of movies in the library" do
      library.add(shawshank_redemption)
      library.add(chasing_amy)
      library.total_count.should == 2
    end

    it "should not allow duplicate movies into the library" do
      library.add(man_on_fire)
      library.add(man_on_fire)
      library.total_count.should == 1
    end
  end
end
