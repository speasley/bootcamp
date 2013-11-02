class Movie
  attr_reader :title

  def initialize(attributes)
    @title, @studio = attributes.values_at(:title, :studio)
  end

  def ==(other)
    title == other.title
  end
end
