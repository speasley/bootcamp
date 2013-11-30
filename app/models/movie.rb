class Movie < ActiveRecord::Base
  attr_reader :title, :studio, :year
end