class Movie < ActiveRecord::Base
  belongs_to :studio
  validates_uniqueness_of :title

  def self.sort_movies_by_preferred_studios_and_release_date_ascending
    rankings = [Studio::Pixar, Studio::Disney, Studio::CastleRock, Studio::MiramaxFilms, Studio::RegencyEnterprises]
    Movie.all.sort do |x, y|
      result = rankings.find_index(x.studio) <=> rankings.find_index(y.studio)
      if( result == 0)
        x.year <=> y.year
      else
        result
      end
    end
  end
end
