

class Person
  def self.met(name, &block)
    self.send(:define_method, name) do
      @result ||= block.call
    end
  end

  met(:name) { "hello #{rand(100)}" }
end


mo = Person.new
puts mo.name
puts mo.name
puts mo.name
puts mo.name