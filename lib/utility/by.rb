class By
  class << self
    def method_missing(field)
      SortBy.new(field)
    end

    def rank(rankings)
      RankedComparer.new(rankings)
    end
  end

  class SortBy
    include Comparer

    def initialize(field)
      @field = field
    end

    def compare(x, y)
      x.public_send(@field) <=> y.public_send(@field)
    end
  end
end

