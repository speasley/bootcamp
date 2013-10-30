require 'helpers'

class MovieLibrary
  include Enumerable

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

  def find_all_movies_by_pixar
    find_all do |movie|
      movie.studio == Studio::Pixar
    end
  end

  def find_all_movies_by_pixar_or_disney
    movies_by_disney = find_all do |movie|
      movie.studio == Studio::Disney
    end
    find_all_movies_by_pixar + movies_by_disney
  end
end
