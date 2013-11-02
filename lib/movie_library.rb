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

  def find(specification)
    find_all do |movie|
      specification.matches?(movie)
    end
  end

  def sorted(comparer)
    @movies.sort_using(comparer)
  end
end
