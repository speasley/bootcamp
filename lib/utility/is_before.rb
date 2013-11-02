class IsBefore
  include Specification

  def initialize(field, target)
    @field, @target = field, target
  end

  def matches?(item)
    item.public_send(@field) < @target
  end
end

