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
  
  def find_all_movies_by_pixar_or_disney()
    @pixar_disney_movies = []
    @movies.each do |m|
      @pixar_disney_movies.push(m) if m.studio == Studio::Pixar || m.studio == Studio::Disney
    end
    @pixar_disney_movies
  end
  
  def find_all_movies_not_published_by_pixar()
    @non_pixar_movies = []
    @movies.each do |m|
      @non_pixar_movies.push(m) if m.studio != Studio::Pixar
    end
    @non_pixar_movies
  end
  
  def find_all_movies_published_after_2004()
    @post_2004_movies = []
    @movies.each do |m|
      @post_2004_movies.push(m) if m.year_published > 2004
    end
    @post_2004_movies
  end
  
  def find_all_movies_between_1982_and_2003()
    @movies1982_to_2003 = []
    @movies.each do |m|
      @movies1982_to_2003.push(m) if m.year_published >= 1982 && m.year_published <= 2003
    end
    @movies1982_to_2003
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
