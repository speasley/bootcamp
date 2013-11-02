class Matches
  include Specification

  def initialize(property, target)
    @property, @target = property, target
  end

  def matches?(item)
    item.public_send(@property) == @target
  end
end
