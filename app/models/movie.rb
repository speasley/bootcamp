class Movie < ActiveRecord::Base
  validates_uniqueness_of :title
  belongs_to :studio
end