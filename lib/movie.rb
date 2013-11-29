class Movie
  attr_reader :title, :studio, :year

  def initialize(attributes)
    @title, @studio, @year = attributes.values_at(:title, :studio, :year_published)
  end

  def ==(other)
    title == other.title
  end
end
