require "spec_helper"
require 'database_cleaner'

describe Movie do
  let(:shawshank_redemption) { create_movie(title: "The Shawshank Redemption", studio_id: 1, year: 1994) }
  let(:chasing_amy) { create_movie(title: "Chasing Amy", studio_id: 2, year: 1997) }
  let(:man_on_fire) { create_movie(title: "Man on Fire", studio_id: 3, year: 2004) }
  
  let(:toy_story) { create_movie(title: "Toy Story", studio_id: 4, year: 1995) }
  let(:up) { create_movie(title: "Up", studio_id: 4, year: 2006) }
  let(:cars) { create_movie(title: "Cars", studio_id: 4, year: 2009) }
  let(:monsters_inc) { create_movie(title: "Monsters Inc.", studio_id: 4, year: 2001) }
  
  let(:fantasia) { create_movie(title: "Fantasia", studio_id: 5, year: 1940) }
  let(:dumbo) { create_movie(title: "Dumbo", studio_id: 5, year: 1941) }
  let(:pinocchio) { create_movie(title: "Pinocchio", studio_id: 5, year: 1940) }
  
  let(:all_movies) { [shawshank_redemption, chasing_amy, man_on_fire, toy_story, up, cars, monsters_inc, fantasia, dumbo, pinocchio] }

  def create_movie(details)
    Movie.create(details) unless Movie.find_by title: details[:title]
  end

  context "when adding a movie to the library" do
    it "should increase the total number of movies in the library" do
      create_movie(title: "The Shawshank Redemption")
      create_movie(title: "Chasing Amy")
      Movie.count.should == 2
    end

    it "should not allow duplicate movies into the library" do
      create_movie(title: "Man on Fire")
      create_movie(title: "Man on Fire")
      Movie.count.should == 1
    end

    it 'cannot add two movies that have the same title (logically the same)' do
      create_movie(title: 'Old School')
      create_movie(title: 'Old School')
      Movie.count.should == 1
    end
  end

  context 'Searching for movies' do
    
    before :each do
      all_movies    
    end
  
    it 'Can find all pixar movies' do
      results = Movie.where(:studio_id => Studio::Pixar)
      results.count.should == 4
      results.should include(toy_story)
      results.should include(up)
      results.should include(cars)
      results.should include(monsters_inc)
    end

    it 'Can find all movies published by pixar or disney' do      
      results = Movie.where(:studio_id => [Studio::Pixar, Studio::Disney])
      results.count.should == 7
      results.should include(toy_story)
      results.should include(up)
      results.should include(cars)
      results.should include(monsters_inc)
      results.should include(fantasia)
      results.should include(dumbo)
      results.should include(pinocchio)
    end

    it 'Can find all movies not published by pixar' do
      results = Movie.where.not(:studio_id => Studio::Pixar)
      results.length.should == 6
      results.should include(fantasia)
      results.should include(dumbo)
      results.should include(pinocchio)
      results.should include(shawshank_redemption)
      results.should include(chasing_amy)
      results.should include(man_on_fire)
    end

    it 'Can find all movies released after 2004' do
      results = Movie.where("year > 2004")
      results.length.should == 2
      results.should include(up)
      results.should include(cars)
    end

    it 'Can find all movies released between 1982 and 2003 - Inclusive' do
      results = Movie.where("year >= 1982").where("year <= 2003")
      results.length.should == 4
      results.should include(shawshank_redemption)
      results.should include(chasing_amy)
      results.should include(toy_story)
      results.should include(monsters_inc)
    end
  end

  context 'Sorting movies' do
    before :each do
      all_movies.each { |x| library.add(x) }
    end

    xit 'Sorts all movies by descending title' do
      expected_order = [up, toy_story, shawshank_redemption, pinocchio, monsters_inc, man_on_fire, fantasia, dumbo, chasing_amy, cars]
      results = library.sort_movies_by_title_descending
      results.should == expected_order
    end

    xit 'Sorts all movies by ascending title' do
      expected_order = [cars, chasing_amy, dumbo, fantasia, man_on_fire, monsters_inc, pinocchio, shawshank_redemption, toy_story, up]
      results = library.sort_movies_by_title_ascending
      results.should == expected_order
    end

    xit 'Sorts all movies by descending release date' do
      expected_order = [cars, up, man_on_fire, monsters_inc, chasing_amy, toy_story, shawshank_redemption, dumbo, fantasia, pinocchio ]
      results = library.sort_movies_by_descending_release_date
      results.should == expected_order
    end

    xit 'Sorts all movies by ascending release date' do
      expected_order = [pinocchio, fantasia, dumbo, shawshank_redemption, toy_story, chasing_amy, monsters_inc, man_on_fire, up, cars]
      results = library.sort_movies_by_ascending_release_date
      results.should == expected_order
    end

    xit 'Sorts all movies by preferred studios and release date ascending' do
      #rankings: Pixar, Disney, CastleRock, MiramaxFilms, RegenceyEnterprises
      expected_order = [ toy_story, monsters_inc, up, cars, fantasia, pinocchio, dumbo, shawshank_redemption, chasing_amy, man_on_fire]
      results = library.sort_movies_by_preferred_studios_and_release_date_ascending
      results.should == expected_order
    end
  end

  context "equality" do
    xit "should not equal" do
      blah = create_movie(title: 'blah')
      huh = create_movie(title: 'huh')
      blah.should_not == huh
    end

    xit "should equal" do
      huh1 = create_movie(title: 'huh')
      huh2 = create_movie(title: 'huh')
      huh1.should == huh2
    end
  end
  
end