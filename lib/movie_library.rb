require 'helpers'

class MovieLibrary
  include Helpers

  def initialize(movies = [])
    @movies = movies
  end

  def add(movie)
    exists = false
    @movies.each do |m|
      exists = true if movie.title == m.title
    end
    @movies.push(movie) if exists == false
  end

  def total_count
    @movies.size
  end
  
  def find_all_movies_by_pixar()
    @pixar_movies = []
    @movies.each do |m|
      @pixar_movies.push(m) if m.studio == Studio::Pixar
    end
    @pixar_movies
  end

  def each
    # @movies.count.times do |n|
    #   yield @movies[n]
    # end

    # n = 0
    # loop do
    #   current = @movies[n]
    #   puts current
    #   return unless current
    #   yield current
    #   n += 1
    # end

    # for x in @movies
    #   yield x
    # end

    # i = 0
    # current = @movies[i]
    # while current do
    #   yield current
    #   current = @movies[i]
    #   i+=1
    # end

    # i = 0
    #   until i == @movies.count do
    #     yield @movies[i]
    #     i +=1
    #   end
    #       
    #i =0
    #yield @movies[i]; i+=1 until @movies.count==i
    #      

    # puts "blah" while true
    @movies.each do |movie|
      yield movie
    end
  end
end
