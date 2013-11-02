module Specification
  def or(other)
    BlockSpecification.new do |item|
      matches?(item) || other.matches?(item)
    end
  end

  def and(other)
    BlockSpecification.new do |item|
      matches?(item) && other.matches?(item)
    end
  end

  def not
    BlockSpecification.new do |item|
      !matches?(item)
    end
  end
end
