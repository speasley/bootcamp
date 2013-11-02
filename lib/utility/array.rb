class Array
  def sort_using(comparer)
    sort do |x, y|
      comparer.compare(x, y)
    end
  end
end

