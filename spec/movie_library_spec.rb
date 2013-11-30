require "spec_helper"

describe MovieLibrary do
  let(:library) { MovieLibrary.new }
  let(:shawshank_redemption) { create_movie(title: "The Shawshank Redemption", studio: 1, year: 1994) }
  let(:chasing_amy) { create_movie(title: "Chasing Amy", studio: Studio::MiramaxFilms, year: 1997) }
  let(:man_on_fire) { create_movie(title: "Man on Fire", studio: Studio::RegencyEnterprises, year: 2004) }

  let(:toy_story) { create_movie(title: "Toy Story", studio: Studio::Pixar, year: 1995) }
  let(:up) { create_movie(title: "Up", studio: Studio::Pixar, year: 2006) }
  let(:cars) { create_movie(title: "Cars", studio: Studio::Pixar, year: 2009) }
  let(:monsters_inc) { create_movie(title: "Monsters Inc.", studio: Studio::Pixar, year: 2001) }

  let(:fantasia) { create_movie(title: "Fantasia", studio: Studio::Disney, year: 1940) }
  let(:dumbo) { create_movie(title: "Dumbo", studio: Studio::Disney, year: 1941) }
  let(:pinocchio) { create_movie(title: "Pinocchio", studio: Studio::Disney, year: 1940) }

  let(:all_movies) { [shawshank_redemption, chasing_amy, man_on_fire, toy_story, up, cars, monsters_inc, fantasia, dumbo, pinocchio] }

  def create_movie(details)
    Movie.create(details)
  end

  context "when adding a movie to the library" do
    it "should increase the total number of movies in the library" do
      library.create(shawshank_redemption)
      library.create(chasing_amy)
      library.total_count.should == 2
    end

    xit "should not allow duplicate movies into the library" do
      library.add(man_on_fire)
      library.add(man_on_fire)
      library.total_count.should == 1
    end

    xit 'cannot add two movies that have the same title (logically the same)' do
      library.add(create_movie(:title => 'Old School'))
      library.add(create_movie(:title => 'Old School'))
      library.total_count.should == 1
    end
  end

  context 'Searching for movies' do
    before :each do
      all_movies.each { |x| library.add(x) }
    end

    xit 'Can find all pixar movies' do
      results = library.find_all_movies_by_pixar
      results.count.should == 4
      results.should include(toy_story)
      results.should include(up)
      results.should include(cars)
      results.should include(monsters_inc)
    end

    xit 'Can find all movies published by pixar or disney' do
      results = library.find_all_movies_by_pixar_or_disney
      results.count.should == 7
      results.should include(toy_story)
      results.should include(up)
      results.should include(cars)
      results.should include(monsters_inc)
      results.should include(fantasia)
      results.should include(dumbo)
      results.should include(pinocchio)
    end

    xit 'Can find all movies not published by pixar' do
      results = library.find_all_movies_not_published_by_pixar
      results.length.should == 6
      results.should include(fantasia)
      results.should include(dumbo)
      results.should include(pinocchio)
      results.should include(shawshank_redemption)
      results.should include(chasing_amy)
      results.should include(man_on_fire)
    end

    xit 'Can find all movies released after 2004' do
      results = library.find_all_movies_published_after_2004
      results.length.should == 2
      results.should include(up)
      results.should include(cars)
    end

    xit 'Can find all movies released between 1982 and 2003 - Inclusive' do
      results = library.find_all_movies_between_1982_and_2003
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
