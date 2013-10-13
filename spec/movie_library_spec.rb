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

    it 'cannot add two movies that have the same title (logically the same)' do
    end
  end

  context 'Searching for movies' do
    it 'Can find all pixar movies' do
    end

    it 'Can find all movies published by pixar or disney' do
    end

    it 'Can find all movies not published by pixar' do
    end

    it 'Can find all movies released after 2004' do
    end

    it 'Can find all movies released between 1982 and 2003 - Inclusive' do
    end
  end

  context 'Sorting movies' do
    it 'Sorts all movies by descending title' do
    end

    it 'Sorts all movies by ascending title' do
    end

    it 'Sorts all movies by descending release date' do
    end

    it 'Sorts all movies by ascending release date' do
    end

    it 'Sorts all movies by preferred studios and release date ascending' do
    end
  end
end
