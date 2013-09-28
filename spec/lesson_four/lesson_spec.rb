require 'spec_helper'

class Blah
end

module LifeBoat
  class FloatationDevice
  end
end

module Queryable
    def matches?
    each do |item|
      result = yield(item) if block_given?
      return item if result
    end
    nil
  end 
end


class Book
  attr_reader :title
  
  def initialize(title)
    @title = title
  end
end

class Library
  include Queryable
  
  def initialize(books = [])
    @books = books
  end
  
  def add(book)
    @books.push(book)
  end
  
  def has_book?(title)
    matches? do |book|
      book.title == title
    end
  end
  
  private
  
  def each
    @books.each do |book|
      yield book
    end
  end  
end

describe "modules" do
  it "can float" do
    device = LifeBoat::FloatationDevice.new
    device.should_not be_nil
  end
  
  context "Library" do
    let(:library) { Library.new }
    
    before :each do
      library.add(Book.new("roots"))
      library.add(Book.new("the life of pie"))
      library.add(Book.new("the curious incident of the dog in the night time"))
    end
    
    it "can find all items that match" do
      library.has_book?("the curious incident of the dog in the night time").should be_true
    end
    
    it "should return false if the book is not in the library" do
      library.has_book?("george of the jungle").should be_false
    end
  end
end