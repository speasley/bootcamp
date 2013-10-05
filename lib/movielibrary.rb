require 'helpers'

module MovieLibrary
  
  class MovieLibrary
    
    def initialize(movies = [])
      @movies = movies
    end

    def add(movie)
      @movies.push(movie) unless Helpers.include?(@movies,movie)
    end

    def total_count
      @movies.size
    end

    def include?(movie)
      match = false
      @movies.each do |m|
        match = true if m == movie
      end
      match
    end

  end
end