require "spec_helper"
require 'ostruct'

class Book
  attr_accessor :title
  def to_s
    title
  end
end

class Library
  def initialize(books = [])
    @books = books
  end
  
  def add(book)
    @books.push(book)
  end
  
  def print_each_title
    puts "PRINTING EACH TITLE #{@books.size}"
    @books.each do |book|
      puts book
    end
  end
end

describe Library do
  xit "can add a book to the library" do
    library = Library.new
    book = Book.new
    library.add(book)
    book.title = "blah"
    library.print_each_title
  end
  
  it "can pass by value" do
    library = Library.new
    book = 1
    library.add(book)
    book = "not blah"
    library.print_each_title    
  end
  
end