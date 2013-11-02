class Movie
  attr_reader :title, :studio, :year_published

  def initialize(attributes)
    @title, @studio, @year_published = attributes.values_at(:title, :studio, :year_published)
  end

  def ==(other)
    self.title == other.title
  end

  def to_s
    title
  end

  def inspect
    to_s
  end

  class << self
    def published_after(year)
      IsAfter.new(:year_published, year)
    end

    def published_before(year)
      IsBefore.new(:year_published, year)
    end
  end
end
