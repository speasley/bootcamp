require 'helpers'

class MovieLibrary
  include Helpers

  def initialize(movies = [])
    @movies = movies
  end

  def add(movie)
    @movies.push(movie) unless include?(movie)
  end

  def total_count
    @movies.size
  end

  def each
    @movies.each do |movie|
      yield movie
    end
  end

  def find_all_matching(&block)
    @movies.find_all do |movie|
      block.call(movie)
    end
  end

  def find_all_movies_by_pixar
    find_all_matching do |x|
      x.studio == Studio::Pixar
    end
  end

  def find_all_movies_by_pixar_or_disney
    find_all_matching do |x|
      x.studio == Studio::Pixar || x.studio == Studio::Disney
    end
  end

  def find_all_movies_not_published_by_pixar
    @movies - find_all_movies_by_pixar
  end

  def find_all_movies_published_after_2004
    find_all_matching { |movie| movie.year > 2004 }
  end

  def find_all_movies_between_1982_and_2003
    find_all_matching { |movie| movie.year >= 1982 && movie.year <= 2003 }
  end

  def sort_movies_by_title_ascending
    @movies.sort_by { |movie| movie.title }
  end

  def sort_movies_by_title_descending
    sort_movies_by_title_ascending.reverse
  end

  def sort_movies_by_descending_release_date
    sort_movies_by_ascending_release_date.reverse
  end

  def sort_movies_by_ascending_release_date
    @movies.sort_by { |movie| movie.year }
  end

  def sort_movies_by_preferred_studios_and_release_date_ascending
    rankings = [Studio::Pixar, Studio::Disney, Studio::CastleRock, Studio::MiramaxFilms, Studio::RegencyEnterprises]
    @movies.sort do |x, y|
      result = rankings.find_index(x.studio) <=> rankings.find_index(y.studio)
      if result == 0
        x.year <=> y.year
      else
        result
      end
    end
  end
end
